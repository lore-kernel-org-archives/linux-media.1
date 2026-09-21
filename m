Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E942435EEA
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 08:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978076; cv=none; b=T+6SFDe9bUGwRpiXHOv7h3vhqsZ90Tw9I1+CxHbtFZWEPomI3ztMGAogqRbXSunzlLCXNeC7uOw0wdpq2wlFfSdaUgvzhMQ9epWXdcR+dXyKZe55WaV9ONRa93URRRJx8/f6yfWahUN+C9MB0AuAqggZz5F81Dqp5Vtjyt0eIiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978076; c=relaxed/simple;
	bh=cvH+3WuyEr47wv0KGVgUlCmeKmek7sC8jywD80CvJHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYAMoIeFhQTPKu1NXIAVz5ve2GW1OLrj7Su9WpcEZNG+/RTN4aS3kOo34cva0gXoYFABcqSe2sLMjhdF7ZzTp+w2zk4jphLXiuAc9m+yAIaBgdvMY3ntGA4Gpy9SzVKcPQFeyzzqwsfMlup2X2Y2ptXRnrW37i99EyTSGDkYtfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1/2pkcE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CLzyI/Hy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1/2pkcE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CLzyI/Hy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79kPh1458260
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 08:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/XiM1eC4dLtplLQwP0/XNULh
	NoHo+cmbZwnS6s14+1s=; b=R1/2pkcEdFJGNqDx1lYarEAxY6sVthU547XrDWWk
	RDPJJgwyk494ayoml09u/siMx4VdzTEjvj5It7Z/M75HOXMuISRVEWJQhV7UIZu2
	NHZzDYhnzszHD/19AGX5T/iYUuU8rKUj/jTrDOZD502DsulKxe+JWS+WVq1yd79H
	QcbXSVfZoD5sEdIYYnczNzcDVHbAKQXME9RsZ78MkPnnzmCNWoVpPUeSBrFFCCXD
	2Z/Dk9WpfpHLPgmzsNg9/xsZJOzZHkpQiJcR08ymHbejbB5fVmcelAT9ZNWauEaH
	3E+Su1axT86dDF6xvVL0S7KTgOJQrE+H9RJ6NOX2PdO3UQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3v9bq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 08:07:54 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91213a1aa68so46769946d6.0
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 01:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789978074; x=1790582874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/XiM1eC4dLtplLQwP0/XNULhNoHo+cmbZwnS6s14+1s=;
        b=CLzyI/HyRRL/Zyoma6Qh9y4fO3j/IY8v0Mu4XqcbF7eutkKWxDZHNjAhoKSoocWiaO
         g4CwOPi5Gw4Y2i/MonL5VMuIzcLanS0zGRM7vdGz8LzRI1+uFTHwx5t5QMJDhY1xTTNz
         AV3R9avzzmxiJiaD7mwdpPS3CP/yAEU1dkmjI7RzK61sh/TM9I9y6KvZxFRed2uKBtQR
         jxnGsJ5a+GCXxizuD05qRDrFzE3POLl+AkoLi71mv0xwjKZmRAS+J8l4IvptTsKPh5qn
         hxRvDJKwETEJi8mt3IRSVcEMK2GiaJ9k3wYfJI0A0Kz2Lw9ZAbo2R7lqHziIXxp+aYeM
         IpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978074; x=1790582874;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XiM1eC4dLtplLQwP0/XNULhNoHo+cmbZwnS6s14+1s=;
        b=ebb0Km2ytDac5iRPVl+L04NxuSu7kiCGmv8mzR9PonLDmW1mjZmhhfl3f6IU504Ngw
         r5K/M5QEW9+GJMnYvTOKGMJsdUMk9ko/eOMqsd2uUr23j7WkbI2E9dmGTHjOQM/oQHsB
         UcZPn94iliE+W52Bd9b8ZGN6G56wYsPM0G3jr6vq/X8YE5+Uwi+Q29YlPmu+yNXCayM5
         6CgqsTulma0W2TMb7gd9EKuakq5vdT9G+5H5WA3HstxF1lyivdEoUjXX4FXW4DesoyOr
         bgtZ68Qh3BN7JzHWyxb2hGpV9P3xg49zEvIZZn1zCh4rImujx+cLXARD4EFe4aw+opyK
         Et2g==
X-Forwarded-Encrypted: i=1; AKwUvBwalKn69N2DpJN6nJXylyC5bqs7I5FiK5UfHMuDHukIjue5zb9Hknhh3eaM+tYVAGLZsHrgNbbhMg/7nA==@vger.kernel.org
X-Gm-Message-State: AFuF++nH/GWdPL6vfynfg5q72u2KLF21uIauoh3cu1DQnxStcJvFbS1l
	saxN63Yk80WLH8fsHoJ46zF1cesyj/rHSW4qmu6D4aOa9AdQZ0S8nlK21KWyA32dSRvcT2n5nus
	Ev15Mvh4DRs/60PSuuwZa1CMAsRqYPXf9AcczD+P6N71lCtlr3co81vyjJuBQAuLWoA==
X-Gm-Gg: AYBFou3H/R7hnIEjAxmIhTwO6rtInz88oJAt6zZLW9s1eIXOz1cIWumzYCNGoynGrwn
	byO8RosJ9PBxcP4ZPJ61C9gv0mj9TzD2Gcgk1GlA1tJzTrLkeKsvxiLx4LwYuWg+M4dOfvg5kM1
	eQv3QmWh8GSE8AqCbL6VYuZ7C6NiT/8T4ZQIQbGKCdyVIwFeV0AnlkE4zlG7VUF93wCxodYPvvZ
	kvLHWPw7cZRkg7oBS9JBvIAzRI8lMJ4LMQ9BOCJ0idql9GTR2CGyotvWbo4r5OMfL9jcb6zfE6o
	SNX2Z7jblB2JKojBj3oUzcG1D56O/qG934GYj++VY3z8b+Jur6x3Io1RO3J2n1p0UGWDZotCC+D
	uLbawzYw7dgYZ8vQ=
X-Received: by 2002:a05:620a:1a12:b0:939:c3e6:86d6 with SMTP id af79cd13be357-93bf5719c81mr978155085a.48.1789978073639;
        Mon, 21 Sep 2026 01:07:53 -0700 (PDT)
X-Received: by 2002:a05:620a:1a12:b0:939:c3e6:86d6 with SMTP id af79cd13be357-93bf5719c81mr978149685a.48.1789978073021;
        Mon, 21 Sep 2026 01:07:53 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc58a1176sm199397265e9.2.2026.09.21.01.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:07:52 -0700 (PDT)
Date: Mon, 21 Sep 2026 11:07:50 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: nord-ride-embedded: Enable iris
 video codec node
Message-ID: <th6om2dcxrm2a5kjn64ufunlm4zoubghdcnyvw6ll5xrszegqo@veekszeed2bo>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-3-94428761ec06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919-nord-iris-v1-3-94428761ec06@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab0e5da cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=yR8J6TAb7IqefvQR2IsA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: IdJwdt1zrTu02AvBNEkg0DMQg2V-Y35-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfX6SOvfJQebafb
 tMdPcf2NJY3DGFCOe/BN6sqNDFqFKymuPiPZfz/98atnVecRPjDD7fsthW0InMei0Mk01IQ9vCK
 J/sBxX23sWqKSr60kTVOi2QhuHtbFuE=
X-Proofpoint-GUID: IdJwdt1zrTu02AvBNEkg0DMQg2V-Y35-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfX5oWy339d1gl1
 dN9vbjVL7UnNV8ZCF9iZRU1ZckUWCMtNv9pqqzlhNIVGsuB94sqDiHl5FTFql5xf/2Rsmm+W79z
 W11Ra9PnALqYThWe2hXINGaAZoYQ5YeyawMSf5/Rc/+9JMiVPVFnm+QKjn0bbFslPecpt15jpA9
 +SEyJ4C+j6Qa0dzqyvh7x2YVAuklJ94FNFhZqRoQ6Kxa3CDvQ+4KOygu7oSGMzQkwjgqveczKgh
 5RP3ASmdxu0zX6t+S9uqHdiToWSCO1xHYy+qUtxpQPh8O3ANoSUJJM+hPNzItK2qbZPrwtggls5
 p0h75T1Bz0nzU8/+phh4QgkQKY/w7ukTsQls8bbttwu9WNFwUgRGGCP7DgrbXN+SFYi2Uft0/qI
 LK43Yb38coYjGx7HD3BELgE/E8/9Jnq/K1V+WdTeL/OmNtj/Vkecb8nC5LZZL5Avwlv/KUNz1MH
 Itox5tkUp6ZefgqFROw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210115

On 26-09-19 10:14:57, Vishnu Reddy wrote:
> The iris hardware block is described in the nord SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
