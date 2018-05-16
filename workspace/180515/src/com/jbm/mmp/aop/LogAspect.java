package com.jbm.mmp.aop;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class LogAspect {

  private  Log log = LogFactory.getLog(LogAspect.class);
  
  public void ss(JoinPoint jp) {
    
  }
  
  @Around(value="execution(* com.jbm.mmp..*.*(**))")
  public Object sdf(ProceedingJoinPoint pjp) throws Throwable {

    Signature signature = pjp.getSignature();
  
    // 전처리
    log.info("전처리:" + signature.getName());
    System.out.println("전처리:" + signature.getName());
    
    Object o = pjp.proceed();
    
    //후처리
    System.out.println("후처리:" + signature.getName());
    return null;
  }
}
