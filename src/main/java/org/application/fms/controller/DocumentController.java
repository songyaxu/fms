package org.application.fms.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.application.fms.bean.Document;
import org.application.fms.bean.FileMap;
import org.application.fms.bean.Page;
import org.application.fms.bean.Result;
import org.application.fms.bean.User;
import org.application.fms.bean.vo.DocumentVO;
import org.application.fms.enums.CrypticClassEnum;
import org.application.fms.enums.InputTypeEnum;
import org.application.fms.enums.UserTypeEnum;
import org.application.fms.param.DocQueryParam;
import org.application.fms.param.MapQueryParam;
import org.application.fms.service.DocumentService;
import org.application.fms.service.FileMapService;
import org.application.fms.service.UserService;
import org.application.fms.util.PageUtil;
import org.application.fms.util.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping("doc")
public class DocumentController {
	
	@Autowired
	private DocumentService documentService;
	
	@Autowired
	private FileMapService fileMapService;
	
	@Autowired
	private UserService userService;
	
	public  int PAGE_SIZE=10;
	public  String FILE_LOCATION="/webapp/file";
	
	@RequestMapping("init")
	public String init() {
		return "file/add";
	}
	
	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
    public Result upload(@RequestParam("file") MultipartFile file,Document doc,HttpSession session) {
		if(CollectionUtils.isEmpty(doc.getMmm()))
		{
			return Result.failure("上传失败，上传到部门不能为空。");
		}
		if(file.getSize()!=0) {
			String time = TimeUtil.getTimeFilePath();
	        String path = FILE_LOCATION+time+"/";
	        String fileName = file.getOriginalFilename();
	        System.out.println(path);
	        File targetFile = new File(path, fileName);
	        if (!targetFile.exists()) {
	            targetFile.mkdirs();
	        }
	        try {
	            file.transferTo(targetFile);
	        } catch (Exception e) {
	        	return Result.failure("上传失败");
	        }
	        User user = (User) session.getAttribute("user");
			if(doc.getAttachmentName()==null||"".equals(doc.getAttachmentName()))
			{
				doc.setAttachmentName(fileName);
			}else {
				String str[] = fileName.split("\\.");
				doc.setAttachmentName(doc.getAttachmentName()+"."+str[str.length-1]);
			}
			doc.setAttachment(path+fileName);
			doc.setDate(TimeUtil.currentTime());
			doc.setFrom(user.getTypeId());
			doc.setInputType(InputTypeEnum.ENTER.getKey());
			doc.setSignatory(user.getSerial());
			doc.getMmm().add(user.getTypeId());
			int res=documentService.add(doc);
			if(res>=1) {
				
				FileMap fm =new FileMap();
				for(int i = 0 ; i< doc.getMmm().size();i++) {
					UserTypeEnum userTypeEnum = UserTypeEnum.getEnumByCode(doc.getMmm().get(i));
					switch(userTypeEnum) {
					case COLLEGE: if(user.getTypeId()==6)fm.setLevel1(1); else if(user.getTypeId()>1) fm.setLevel1(2);else fm.setLevel1(1);break;
		    		case BRANCHOFTEACHERONE: if(user.getTypeId()>2) fm.setLevel2(2); else fm.setLevel2(1);break;
		    		case BRANCHOFTEACHERTWO: if(user.getTypeId()>3) fm.setLevel3(2); else fm.setLevel3(1);break;
		    		case POSTGRADUATE: if(user.getTypeId()>4) fm.setLevel4(2); else fm.setLevel4(1);break;
		    		case UNDERGRADUATE: fm.setLevel5(1);break;
		    		case UNIVERSITY: fm.setLevel6(2);;break;
		    		default: ;
					}
				}
				fm.setFileId(doc.getSerial());
				int r= fileMapService.add(fm);
				if(r>=1)
					return Result.success("上传成功");
				else
					return Result.failure("上传失败");
			}
			else
				return Result.failure("上传失败");
	        
		}
		return Result.failure("上传失败");
    }
	
	@RequestMapping("list/{pageNo}")
	public String list(@PathVariable("pageNo") int pageNo,DocQueryParam param,HttpSession session) {
		User user = (User) session.getAttribute("user");
		Integer total =0;
		param.setLevel(user.getTypeId());
		param.setDate(TimeUtil.ToDate(param.getDatetime()));
		total=documentService.getCount(param);
		Page page = new Page();
		page=PageUtil.createPage(10, total, pageNo);
		param.setPage(page);
		List<Document> docList=documentService.getListByParam(param);
		List<DocumentVO> docVoList = new ArrayList<DocumentVO>();
		docList.forEach(document->{
			docVoList.add(transDocument2DocumentVo(document));
		});
		session.setAttribute("docList", docVoList);
		session.setAttribute("docParam", param);
		return "file/list";
	}
	
	@RequestMapping("list2/{pageNo}")
	public String list2(@PathVariable("pageNo") int pageNo,MapQueryParam param,HttpSession session) {
		User user = (User) session.getAttribute("user");
		Integer total =0;
		if(user.getTypeId()==UserTypeEnum.UNIVERSITY.getKey())
			param.setFlag(1);
		else if(user.getTypeId()==UserTypeEnum.COLLEGE.getKey())
			param.setFlag(0);
		else
			return "404";
		total=fileMapService.count(param);
		Page page = new Page();
		page=PageUtil.createPage(10, total, pageNo);
		param.setPage(page);
		List<FileMap> docList=fileMapService.select(param);
		List<DocumentVO> docVoList = new ArrayList<DocumentVO>();
		docList.forEach(fm->{
			Document document = documentService.get(fm.getFileId());
			docVoList.add(transDocument2DocumentVo(document));
		});
		session.setAttribute("docList", docVoList);
		session.setAttribute("docParam", param);
		return "file/list2";
	}
	
	@ResponseBody
	@RequestMapping("approve/{id}")
	public Result approve(@PathVariable("id") int id,int res,HttpServletRequest req) {
		FileMap fm = fileMapService.get(id);
		if (fm.getLevel1()==2) {
			fm.setLevel1(res);
		}
		if (fm.getLevel2()==2) {
			fm.setLevel2(res);
		}
		if (fm.getLevel3()==2) {
			fm.setLevel3(res);
		}
		if (fm.getLevel4()==2) {
			fm.setLevel4(res);
		}
		if (fm.getLevel5()==2) {
			fm.setLevel5(res);
		}
		if (fm.getLevel6()==2) {
			fm.setLevel6(res);
		}
		fileMapService.update(fm);
		if(res == 0)
			return Result.success("已审批：上传文件没有通过审核。");
		return Result.success("已审批：通过审核。");
	}
	
	@RequestMapping("detail/{id}")
	public String info(@PathVariable("id") int id,@RequestParam(value="res",defaultValue="0")int res,HttpServletRequest req) {
		Document doc=documentService.get(id);
		req.setAttribute("doc", transDocument2DocumentVo(doc));
		if(res==1)
			req.setAttribute("res", 1);
		else
			req.setAttribute("res", 0);
		return "file/detail";
	}
	
    @RequestMapping("download/{id}")    
    public ResponseEntity<byte[]> download(@PathVariable(value="id") int id) throws IOException {  
    	Document doc=documentService.get(id);
        File file=new File(doc.getAttachment()); 
        if(file.exists()) {
	        HttpHeaders headers = new HttpHeaders();    
	        String fileName=new String(doc.getAttachmentName().getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题  
	        headers.setContentDispositionFormData("attachment", fileName);   
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);   
	        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),    
	                                          headers, HttpStatus.CREATED);    
        }
        return null;
    }  
    
    @ResponseBody
    @RequestMapping("check/{id}")
    public Result checkFile(@PathVariable(value="id") int id) {
    	Document doc=documentService.get(id);
    	if(doc==null) {
    		return Result.failure("项目不存在");
    	}
    	else {
    		File file=new File(doc.getAttachment()); 
    		if(file.exists()) {
    			return Result.success("文件存在");
    		}else {
    			return Result.failure("文件不存在");
    		}
    	}
    }
    
    @RequestMapping("transferinit/{id}")
	public String transferInit(@PathVariable("id") int id,HttpServletRequest req) {
		req.setAttribute("temp", documentService.get(id));
		FileMap fm = fileMapService.get(id);
		req.setAttribute("enable", fm);
		return "file/transfer";
	}
    
    @ResponseBody
    @RequestMapping("transfer/{id}")
    public Result transfer(@PathVariable("id") int id,HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	String[] list= request.getParameterValues("mmm");
    	if(list==null||list.length==0) {
    		return Result.failure("转发失败，无可转发对象！");
    	}
    	String remark = request.getParameter("remark");
    	User user = (User) session.getAttribute("user");
    	Document doc = documentService.get(id);
    	String message = "";
    	if(doc.getTo()!=0)
    	{
    		message = "该文档曾经过1次或者多次转发，此次转发" + 
    				  "<font style=\"color:red\">"+"成功"+"</font>";
    	}
    	doc.setRemark(doc.getRemark()==null?"":doc.getRemark()+"\r\n" + 
    			"从"+UserTypeEnum.getEnumByCode(user.getTypeId()).getValue()+"到"+UserTypeEnum.getEnumByCode(Integer.valueOf(list[0])).getValue()+"的备注：\r\n"
    			+ remark+"。");
    	doc.setTo(Integer.valueOf(list[0]));
    	int res = documentService.update(doc);
    	if(res>=1)
    	{
    		fileMapService.update(getFileMap(list,fileMapService.get(id),user));
    		return Result.success("转发成功"+(message.equals("")?"":":"+message));
    	}
    	else
    		return Result.failure("转发失败");
    }
    private FileMap getFileMap(String[] list,FileMap map,User user) {
    	for(int i = 0 ;i<list.length;i++) {
    		Integer to = Integer.valueOf(list[i]);
    		switch (to) {
    		case 1: if(user.getTypeId()==6)map.setLevel1(1); else map.setLevel1(1);break;
    		case 2: if(user.getTypeId()>2) map.setLevel2(2); else map.setLevel2(1);break;
    		case 3: if(user.getTypeId()>3) map.setLevel3(2); else map.setLevel3(1);break;
    		case 4: if(user.getTypeId()>4) map.setLevel4(2); else map.setLevel4(1);break;
    		case 5: map.setLevel5(1);break;
    		case 6: map.setLevel6(2);;break;
    		default: break;
    		}
    	}
    	return map;
    }
	
	private DocumentVO transDocument2DocumentVo(Document doc) {
		DocumentVO vo = new  DocumentVO();
		vo.setSerial(doc.getSerial());
		vo.setType(doc.getType());
		vo.setTitle(doc.getTitle());
		vo.setContent(doc.getContent());
		vo.setRemark(doc.getRemark());
		vo.setDate(doc.getDate());
		vo.setDateTime(TimeUtil.formatTime(doc.getDate()));
		vo.setSignatory(doc.getSignatory());
		vo.setSendName(userService.get(doc.getSignatory()).getName());
		vo.setFrom(doc.getFrom());
		vo.setFromStr(UserTypeEnum.getEnumByCode(doc.getFrom()).getValue());
		vo.setTo(doc.getTo());
		vo.setToStr(UserTypeEnum.getEnumByCode(doc.getTo()).getValue());
		vo.setCrypticClass(doc.getCrypticClass());
		vo.setCrypticClassStr(CrypticClassEnum.getEnumByCode(doc.getCrypticClass()).getValue());
		vo.setApplyScope(doc.getApplyScope());
		vo.setAttachment(doc.getAttachment());
		vo.setFileNo(doc.getFileNo());
		vo.setFilePassword(doc.getFilePassword());
		vo.setImageFileName(doc.getImageFileName());
		vo.setAttachmentName(doc.getAttachmentName());
		vo.setInputType(doc.getInputType());
		vo.setInputStr(InputTypeEnum.getEnumByCode(doc.getInputType()).getValue());
		FileMap map = fileMapService.get(doc.getSerial());
		List<Integer> listTo = new ArrayList<>();
		if(map.getLevel1()==1)
			listTo.add(UserTypeEnum.COLLEGE.getKey());
		if(map.getLevel2()==1)
			listTo.add(UserTypeEnum.BRANCHOFTEACHERONE.getKey());
		if(map.getLevel3()==1)
			listTo.add(UserTypeEnum.BRANCHOFTEACHERTWO.getKey());
		if(map.getLevel4()==1)
			listTo.add(UserTypeEnum.POSTGRADUATE.getKey());
		if(map.getLevel5()==1)
			listTo.add(UserTypeEnum.UNDERGRADUATE.getKey());
		if(map.getLevel6()==1)
			listTo.add(UserTypeEnum.UNIVERSITY.getKey());
		for(Integer integer : listTo){
			UserTypeEnum userTypeEnum = UserTypeEnum.getEnumByCode(integer);
			switch (userTypeEnum) {
				case COLLEGE: vo.setToListStr((vo.getToListStr()==null?"":vo.getToListStr()+"、")+UserTypeEnum.COLLEGE.getValue()); break;
				case BRANCHOFTEACHERONE: vo.setToListStr((vo.getToListStr()==null?"":vo.getToListStr()+"、")+UserTypeEnum.BRANCHOFTEACHERONE.getValue()); break;
				case BRANCHOFTEACHERTWO: vo.setToListStr((vo.getToListStr()==null?"":vo.getToListStr()+"、")+UserTypeEnum.BRANCHOFTEACHERTWO.getValue()); break;
				case POSTGRADUATE: vo.setToListStr((vo.getToListStr()==null?"":vo.getToListStr()+"、")+UserTypeEnum.POSTGRADUATE.getValue()); break;
				case UNDERGRADUATE: vo.setToListStr((vo.getToListStr()==null?"":vo.getToListStr()+"、")+UserTypeEnum.UNDERGRADUATE.getValue()); break;
				case UNIVERSITY: vo.setToListStr((vo.getToListStr()==null?"":vo.getToListStr()+"、")+UserTypeEnum.UNIVERSITY.getValue()); break;
				default: break;
			}
		}
		vo.setToList(listTo);
		return vo;
	}
	
}
