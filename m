Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588816;
	b=wlrld2ZKec6rmasX4NHlKBWMQQK59OSqJtoekczb9lDGQgPCzQt2UT4tNFBpJ+vmmYlk
	 Xkz3VyDnLt8tAev8s61cDBk06up4actdyYujRPX+bYJ7JiqckGbFzGdEB4Cbz77zoA9/d
	 oufvrn6BL6WpSNTBgwSjumoNdyjSLgh/DFaZrFhueTCxpDQb55UOrXABK6mjWeOKPGkjJ
	 +nOoGG1YjPNb4Axpnt2emlnQjpRdavBDyWx6ea8hEqkHdzJRBBZJryqDzQvO3quggzeYO
	 16IrVuvJMuft+TB9MNBgfw5brj5Ky0Jq4s2NBWxx/MHLxqf1A99CsbQDfwjidCqOs3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588816;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aSnzuw64QaL2ODuF7dIoTHdiPuBaqdsaTTJECpYAR54=;
	b=kmyerbrJWQUD1HXkTiwmmkzeEyA+zMeV2CeNWQf6l1scKMLtvI/WOXDc0Umd/BhvUU96
	 fquGViU3qbsH1hK0PtPvEQGyhlm8VzuTux0rzaZBBb37/0+2+4GkfNFbCom1dr1u5Hufj
	 Yh5kv64qW9SHkeSRKBNkvFyvpAbQFSeTUG/06QTBrixvrUeW4sOIWFFOp3Np+llL8hCqA
	 WIVL1K/xYEjSgN1zVUuBqIGjwNtqHOMDxJhg5f+4AHSg+TyXdPYUhdLiX+4NZsLqtjHBj
	 HZ1JRLmhCugt53qqhLKKYoOGNpWsnFgy7BHJUTwASMuJh6UVQBUAe64/rMpBc6NTbhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EIv8tbx6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J+DoKJEa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C91606A31F
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 13:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15C91606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EIv8tbx6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J+DoKJEa
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgMER4168158
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 13:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aSnzuw64QaL2ODuF7dIoTHdi
	PuBaqdsaTTJECpYAR54=; b=EIv8tbx6tXPAcGXLwoHMp83UmNhsZWHR/l9I8HDi
	4/NrazfTe4cn1dw9qZPNikqZsw4VVrGPrY4VtSEFy9B6EJYk1yQ+z1v03RCikitv
	K2YIJ0XBiKWbLJwtOzXCYY+SYkCcsRUwgYQ8nuVJdN1UTbWR3t6Lsyk4iRLagU9X
	iwGJ0sXwcyFwUH+4ANIereXBcz7d8bV63FMhwxx9w5IKcrZbrbm0x8MD1BoQOd1M
	Wv/u6WWzBsPnrYV5W0cH9JesZmgnCCTV8T3s+GVT+4io2QwEiMSn4FEkY+DU2lS4
	e2QI7TEEg5n0OPk7FoWS5Dm/se8LLP2qSKvoCQXVATJTVg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0m2p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 13:20:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so226322285a.2
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 06:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792588804; x=1793193604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aSnzuw64QaL2ODuF7dIoTHdiPuBaqdsaTTJECpYAR54=;
        b=J+DoKJEaJGV1exCt6hQsecBbBX2Iem8uDn4CQKHRRp3gFRfaHXPScwY5CH/t2I9ioU
         hWTU6Xitm4StBQO7km1Yj9QKlv9c+XPYDK1KUBBQU5CtGDuugAdNIogOg4ICYs9nMlF4
         1iL24hvmLL4+bLTrxXrI1dCLmOJxRHDe3GaTemPB9cWLaYzOuhcRyASAgiJwoiozf5fY
         XQdw7Obkmoc4AtWLsygd6WgoTA+QMqofxNkitjxWfYxKHDFvfXBDEOw7ySFsEcjVfcN0
         UFO7VvXPycMrzld6Tq5VKNBA7JL+GyJNDTqvejvitz4ISnQSXposFbgPBzdjokeAhCjd
         X+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588804; x=1793193604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSnzuw64QaL2ODuF7dIoTHdiPuBaqdsaTTJECpYAR54=;
        b=EGVOVg+Y/DIB65nqJqW0IR2NVEK09T8/nOb/nsiZvVokZcpIV/8zElnnmNwf1H4b2N
         M6wbDHA6rXhklkf7TJBb5XGTR3gD/ZPsz9PV+u+f9FgyaUX7wLXIkFyWahBbBXUCvRi1
         w2shI5qNoVCkhyjv48k1lZ+8EXR1FnxcjMIzm3y36RVnh0LrwEmC3Ar0dLvb/+QqrI15
         +pK23cxE5Js7xdf87W1kBii6TDq9+xTLukfanENvXAJLoQNeT1prNbcR/eeosxvS826a
         MgyrUKdo2i1XhZGJRpATCU3cxNGWeRcHQC6DzynoeThej0Y7KbZp+lSGodaW67TKYlr4
         wbNw==
X-Forwarded-Encrypted: i=1; AKwUvBwYwDTYTN+5m7v6fgr06StUSxaWrLjaV7LAEC7/JShAWCWsB2cp+I6AmIglyQpl2kPyHjNTNJkqBCs+Xg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJEx0X/Em5xa86VJDsNV/IPAiqPnluh6Rbs+KDC+BgwWxAdFzMz
	OQcGVLh7fKpeeaJGclLXc/GPncv9wLHKU1wfTwE9/Hkb7kHsIADYU7E6Av7Z/sjrnmirgtTaxxC
	5QoPBmJmmYdBuimDkx7EC9L19BfmA7ZG/rCqjegtp7NIM6G+CBeG40K+5fwmuO+ZpYg==
X-Gm-Gg: AYBFou0j8y8S1NTMfOCC93K3oxuBvs9W4+uSQM1KiQebQdCj97MZsRiJ04OJcshbe+8
	ebUUgw+0usDFD6gQtcYr5E+Z+5ovblDsJK/QL0NjrgsxIe2YC4FQwTBn0+BJmQevtq47IaT7JC2
	GLg3OHGinxIW1TX+IMyHHYHTQTF53SfHDxQbYk8nWzmaT9fS2rfyVVMWXEBfojxyDzYDsEulywc
	ppy1WYQNQnU3hFTDRt+EL3ER5CvQ115ZN+8L/d6PZLfHlO3Rx0hELwdfesXGB+7r+CmnAPd/0kS
	ZGsQaaIuf96YVWWZKF06uqcvP7qOaeAgypqaoQHnPmHv3XQIHQe3W6fzdU59RLnIOnVH5h/gN6v
	Yc+qO0b9+sY/nNiJ3kbOJvLrI4ptDN+4tsc9SN4N4M8KaLvq4qJugjp4Mf1gAjdJAmY1yrssh3u
	DC7l6b1xk33KN7
X-Received: by 2002:a05:620a:40d2:b0:93f:571b:c72c with SMTP id af79cd13be357-93f57f66116mr409629485a.46.1792588803981;
        Wed, 21 Oct 2026 06:20:03 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:93f:571b:c72c with SMTP id af79cd13be357-93f57f66116mr409621585a.46.1792588803368;
        Wed, 21 Oct 2026 06:20:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1224fafsm512832e87.63.2026.10.21.06.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:20:01 -0700 (PDT)
Date: Wed, 21 Oct 2026 16:19:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/8] Migrate PAS clients to qcom_mdt_pas_load() and
 qcom_pas_prepare_and_auth_reset()
Message-ID: <zqu4sweaftstbt26v2u3ajzv7snnqswuyrktm7t7k5gh4zi77e@d6t2fpsinvxc>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <ce3f58f7-f500-49f8-89cd-611d8e1ac6ac@oss.qualcomm.com>
 <20261021130735.h7t2c7txqdfohrs6@hu-mojha-hyd.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021130735.h7t2c7txqdfohrs6@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MyBTYWx0ZWRfX8ZqgmJIrzo6b
 uPsd8wRvgAan1vxscWJY98+dXx+4g2044RT8FCfEoemLrqEDCqIPM1rRiuBPAAIC+f3RNQyh2e2
 TKyQXiylgcyLlF4xruO1z46WfPv0Hw//riSiC7Fze7Ngsc36tGeDQabW23+KtpgKDUG8sXZdHPR
 H7YyYGRCP05SD00RRH3nFBGtvoAzxs3Wod4QIy+CX3d68UAoUXS2zHVcZyVoq0kRvMAELhlBwQS
 FQLXKDgzA6UI44AAcK1scFF+31KwEgHtXmcxxAn+zj5CdsFEJoeBRFFA8PT4ExZpu3qKJLk/aDc
 yFudO6ODksOQBTbLlep12jRPRpInLgVZ6QXOixqzJJcnWJbLMsRpmm3ZzHFU3obUkMotDxOLktD
 ocCkpOQjrZ5anUkm+yjAoVqxCRe1NMp9iR2/eJIJHjptsPIVvYTC7nEQ2AdNAP7/rKWyouc4xCP
 Cpn/ew/8vUOtMY7vpTQ==
X-Proofpoint-ORIG-GUID: V-GZxt2YUnMyIMAyY5XINCgilFQGM6ai
X-Proofpoint-GUID: V-GZxt2YUnMyIMAyY5XINCgilFQGM6ai
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MyBTYWx0ZWRfX2zp3Uicv25Y2
 kIVh409tSXBlR+R4ZOUji+WUuudJJHWIkLYhblfQOUP1XBaNl3Tj2aNsu+ybK06SJ8fByENVgjj
 +Jkd31Uie/+BeW4gZdjaKd04ql5/KwE=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8bc05 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=LTSqVt2n0stEVfQD8AYA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210053

On Wed, Oct 21, 2026 at 06:37:35PM +0530, Mukesh Ojha wrote:
> On Wed, Oct 21, 2026 at 01:32:13PM +0200, Konrad Dybcio wrote:
> > On 9/25/26 5:57 PM, Mukesh Ojha wrote:
> > > In preparation to remove qcom_mdt_load() and qcom_pas_auth_and_reset()
> > > public function, migrate every user to the new PAS context-aware API
> > > qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset().
> > > 
> > > This series migrates every remaining caller of the deprecated APIs
> > > (qcom_wcnss, adreno zap shader, iris, venus, IPA, ath12k) and then
> > > removes qcom_mdt_load() and qcom_pas_auth_and_reset() entirely.
> > > 
> > > This series is based on top of although no dependency as such.
> > >   firmware: qcom: pas: Make MDT buffer retention explicit
> > 
> > LLM has the following comments:
> > 
> >  1. Metadata buffer (ctx->ptr) is leaked, and overwritten on
> > reload, because qcom_pas_metadata_release() is never called
> > (patches 1-6)
> >  2. devm_qcom_pas_context_alloc() is called from repeatable runtime
> > paths, so contexts accumulate until unbind (patches 2, 3, 4, 6)
> >  3. use_tzmem is never set, so the shmbridge prepare step never
> > runs on SCM and the commit messages are inaccurate; TEE gets
> > a real mem_phys/mem_size change
> >  4. Not bisectable: patch 4 relies on the NULL mem_region
> > handling that only arrives in patch 7
> >  5. Patches 3 and 4 don't apply to this tree; iris
> > iris_detect_firmware() still needs mem_virt after the load;
> > the base of the series is not stated
> >  6. Patch 7: NULL mem_region now means "map internally", which
> > weakens the -EINVAL sanity check
> >  7. Patch 6: redundant second ioremap_wc() on top of ath12k's
> > persistent memremap()
> >  8. Patch 6: ctx is set under one scm_auth_enabled check and
> > used under another, which is fragile
> >  9. Patch 2: the context now carries the full region size instead of
> > the MDT size, which matters if use_tzmem gets enabled
> > 10. Patch 3: stale qcom_mdt_load() comments remain in
> > iris_firmware.c
> > 11. Patch 8: no issues found
> 
> Thanks.  Will address them along with Sasiko's one.

Just to check. Did you verify your commits with the lockdep and atomic
sleep debugging on?

-- 
With best wishes
Dmitry
