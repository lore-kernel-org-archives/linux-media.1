Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5682ED154
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 02:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789527481; cv=none; b=ScGAiUlqDxU/NSx1zf6shq6kfNDykGy+Ooit86RncodhTl3CD9uO5uEfApvMUPkUSTdhQvMwC8NBgHO6tN8/Gttbmo6Svh0bKckf+fOTqxUszZTa54COaOTyiVVfjvwTHUEvaftBNKxtuGckDyaFBrKNhXPkBRJbodF5WonXkGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789527481; c=relaxed/simple;
	bh=kCximO2sOnisCbU1KtlPdQ0kwgcUNMXMR/DY9mInT0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gfk0Q3FhYgF94Cjmr2EPPLyhr9/4QkX5O1hFCK8b5ql5MU3yLX+APSYqs1XeCRkBJ5KzRKY6fE2Mv6jSnTJKasvdfHa/EU73kTr035hkp9K6wnIRaCCkC6qejO663s2w94U1BoU6MwVucHBK66gwaDsDuDL2Lj+EGyaDA/GF7zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=orH7bhyT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXtaqO+I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="orH7bhyT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IXtaqO+I"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYjoO225042
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 02:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QxUKbcmmujyJc5EWtoiZ+rl/qAHfyBU+aCNAFK4xl3U=; b=orH7bhyT9+ugZmfI
	VImCeaYUBjJ5blLnzBRZL7QgZOamL3fhxZW6ZIYEEWMVcbEYFWqyOYI8XMtlraok
	xgzH1DhGKUomrTddEUzmHD9t3sbpD6BofMD5QralpQ4GEkkFOAX2BI4UvX0XRn0f
	bc0XkQFtUZelPmbNudGdScLAQ3BqmI2IvNmygU/KO8Igkxvd/aTUA6stsmdyxtqE
	w6ev//9VNgU8fc3zNFZ4bbUhOW5Mbj15jmcxbjwzb4gnfGFohcIMdg3HrlklId4x
	6oohXelfjxg6HucD2v0yHENaNphOfBlGHF8afRjvld4NM6mX7qAuK+Uai17WtExT
	duEqTA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnhka5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 02:57:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530256c61b4so107917731cf.3
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 19:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789527478; x=1790132278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QxUKbcmmujyJc5EWtoiZ+rl/qAHfyBU+aCNAFK4xl3U=;
        b=IXtaqO+Idw7Ix5YfdAmIEtFmnTjTGLDVqUhavHc/B69JZMwtCGDLVtWhF1gRSnq/oJ
         +y/7kFDONa7ZpwroOsPej+c9ytC6dN2wG98XlPyhJ0zvzyCCqUILI+K1+j91iEzXMQHz
         fdG38rxKVMxAstRRqtpBxAUiBnqQkEBVv6D4CKpQbjdR+P45jyawIBqTuOwAaLfPYt5E
         NlZBRhuFypUsIzfFgX8Rsrz6KiZ/GNOaX2hp2C8td1Q5oinLAG7y0mHzdj06EpDqs/8A
         kRtyYs3yTO+NTQG7DvYAlFir1TZCkhQWntHblzRopXqfmg1jleHnbWp4JcWM9TraBfn/
         x0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789527478; x=1790132278;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QxUKbcmmujyJc5EWtoiZ+rl/qAHfyBU+aCNAFK4xl3U=;
        b=GFOi5Jv64eUIx++k+oQj/BHrgwRze6CMPfYf6qvOM9vooxlrQZhhaiGhzXrDsohOOu
         QQwwwUQbkEGTNzhBwg+neKA5IXQCMffAY3PsrN8lkumQeBciHMw+Rz5u4CxJnS5KU+oM
         tfqI/3Ra29B8zCfnV7z2N83VuEwu265MRNFipv6w7nRO8XvFLCKQyfP9mnSw75BDFOlh
         yZ1uWi/+fU9JNuHTMzB8KK3aMfL+52F5pOd3/J3DyO6Z6RSCR/+XvwgKHAyalqJH7/+2
         zZqw5oOiew9viA8KW8M4KNkTJmnuzdIJ2+Udnfqftjorzjx+JvoomOeGEe1/CD/s+yqQ
         r1gA==
X-Gm-Message-State: AFuF++me6sdP1oNl+VG9f3mH7DB9o1/4lDMIwkj8b2NMecZOuFaNs9xw
	HutVKGuNhEGswTr3X+R9C3aOPrvjYPoOqbUhTQMEheSRsHuKTibFqWsrzr6gBU1J4orEIPvmp7e
	Ue/S2Ic17rlBxUhYCjSQkWn97PKkdVMtwjK6ey27ZFXLTSszZeRiokTI3vzMD2zJzd8xNQS2xTW
	UV
X-Gm-Gg: AYBFou3Gs8WoKxXU8VummEk81UsIINVI4/0FbsNi2RENJUYpkTDuBUaZLw0tNPCfbgT
	Td0frrgvfUTnrL2rwBl1szIvQOyd0w46GTQ3bgOeiyixj3UEAqT1RI8Sl2BHN/ZujDGejqAl8NB
	EWyWn/KjRBpw5hoMipT07/RVizfD5PI39p61fnXuGJAZvJDa3r7Tb/m+QLa44hwmkX8c9Ccqa8B
	2PTZ1MEmk+If4xxHb++6ugea1GSbe1DR+H226/L8HBcrUl7MM4eHm0lWfq5D5gfF6R7cbQpU8FP
	QrC3c+oDYmt2AxTPp46s9LyT9zgik91WfC5tjcWiYwvLwbh73iefDcpL46+HcspokQPQnXjx7/r
	ey0QKROJiu2FDhAnkRFGhmvV5PG75ALyhI/ESGvr9yap2J5lAA5r1/qVKai4KAfk=
X-Received: by 2002:a05:622a:1aa4:b0:51c:8432:1753 with SMTP id d75a77b69052e-5327ef3a3dcmr15351171cf.30.1789527478391;
        Tue, 15 Sep 2026 19:57:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa4:b0:51c:8432:1753 with SMTP id d75a77b69052e-5327ef3a3dcmr15351031cf.30.1789527477919;
        Tue, 15 Sep 2026 19:57:57 -0700 (PDT)
Received: from [10.111.161.15] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5326208ea78sm11432351cf.24.2026.09.15.19.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 19:57:57 -0700 (PDT)
Message-ID: <c9925024-b293-4349-9105-45ae8aeef75f@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 10:57:52 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [0/6] media: qcom: camss: Add support for Nord CAMSS
To: linux-media@vger.kernel.org
Cc: Linux Media CI <media-ci@linuxtv.org>
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
 <6aa92fc5.2eca3aba.387881.68f4@mx.google.com>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <6aa92fc5.2eca3aba.387881.68f4@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa05b7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=cgb-tkddOU3forQDX4sA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDAzNyBTYWx0ZWRfX9H8wrv48QPEL
 zfNsOSFymssIk4FHi9SnI9ebNc60OZGSnCu4NoS0aKoMe6hMMpnYtrct++SrVpCz0dSFlg38cD8
 3mWZaII1DciGOux8PEvfcepUZbYg/PWpBL57NQ6XnTa5LqebzL7EVKnRMZ01O0ps1zU+hDaqbSr
 fokwxEAdPYA1Ss1LrlPHaLJEVWHqyvgRYj2S6e121rD/ndo0XFeKH6onaDkIl7h/OsEo4K99glG
 CUIcVhm5tAHev1qpJo8/e8Q3ykPKbgQZoLPnRWjdGm4ydAIUdlkg7T5ia49pzdZ/XxdXu+lSTkm
 jVaTWHnYU8QcSwJsMcwSC8J3md+CnDeUCjXxv6ZQoPixvQLlBWimr8iXO8wZl3U+RLaPf/OdNfc
 j9vroW5NHxJDWr9u4R8LLq4JeXizH+ogxf/jb8dLR8dvWDb00xatQDnaqrpTOMm7v5nZlu/8dc+
 vIvAHtsQAHUaAeRVr4g==
X-Proofpoint-GUID: D4E5aUFc5Tf8CBTtL7L-7SxZ69JWY4I6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDAzNyBTYWx0ZWRfX3WcLMMWHyRg9
 u5NXiOBnqrSs6VCpR9uYlc2aGU+l2/3DGURmYF8JQURApAI5yxkmzfJx/hQcwUcALfrjSIS/f9r
 EuCLmRKMOCJ+WmAFiO8YqaSOA+f0DLs=
X-Proofpoint-ORIG-GUID: D4E5aUFc5Tf8CBTtL7L-7SxZ69JWY4I6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160037



On 9/15/2026 7:45 PM, Patchwork Integration wrote:
> Dear Wenmeng Liu:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> # Test checkpatch:./0001-dt-bindings-media-Add-bindings-for-qcom-nord-camss.patch checkpatch
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #24:
> new file mode 100644
> 
> total: 0 errors, 1 warnings, 0 checks, 393 lines checked
> 
> # Test checkpatch:./0002-media-qcom-camss-csid-Add-support-for-CSID-900.patch checkpatch
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #41:
> new file mode 100644
> 
> total: 0 errors, 1 warnings, 0 checks, 389 lines checked
> 
> # Test checkpatch:./0003-media-qcom-camss-vfe-Add-support-for-VFE-gen4.patch checkpatch
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #50:
> new file mode 100644
> 
> total: 0 errors, 1 warnings, 0 checks, 237 lines checked
> 
> # Test dts-bindings:test-dts-binding
> Documentation/devicetree/bindings/media/qcom,nord-camss.example.dts:25:18: fatal error: dt-bindings/clock/qcom,nord-camcc.h: No such file or directory
>     25 |         #include <dt-bindings/clock/qcom,nord-camcc.h>
>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/media/qcom,nord-camss.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/linux-media/users/patchwork/Makefile:1714: dt_binding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> 
> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/110294816/artifacts/report.htm .
> 
> 
> 
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
> 
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> 
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.

Not a issue, linux-next branch already have this file.

Thanks,
Wenmeng


