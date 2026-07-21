Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131C344AB8E
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 21:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784668555; cv=none; b=ETXEo0185dCdBDxugVTMUVClLXnfykMqxEux3ZHKxD+U3iOq4ePVvwiUUu/mH6j110oNeHx9oiJt23fIP7gYEJcsEbEdV5/FMbE/KtManttxeoTqeWQbQ0kNgSgFJRi7UqT8AsSTdObTIgP74fbQuq2uWtOl/eH+P2xJDQ4x2AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784668555; c=relaxed/simple;
	bh=DMovIaz9/G+SHXFwbWHhCTOVIQgwWKOW5MqMNfFcDDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t8Pj9xYNOwnY8l6A4zKVF656WeICEIAfGmQUOLMzFbrQAQ3i0gx1Er+h4W6V8aP6oJ8jClQZR5C1bylQCLFzsvneB7BOqiDdbiCQ37Ln6qtNkGeG2XbC07zwRuoPEe2sVZ2Di/OfPMTR2Qe5/DTb645GFJlvZ9oxHSTc5a+IJt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLU9O2EU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NJElwJdK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLU9O2EU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NJElwJdK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKloYb2795169
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 21:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sowKgixtqzwSBCQCBPAGJXk2
	zmqu0fqYx82mSkSVAfY=; b=iLU9O2EUwg321QRtOHRmlBZibrx3DGTPB/eIopXX
	Esgvq6NGc+IgH2GYqD1Hbnb43M5qHqfNbRY1CaJyDArUCPCkx0v6Musb9LSmouSz
	a+MfalqWETjW5fSdfEUOYSDjvPaaU61tiM83bsMfLmsZTP7oe+crz9RWn7ekGdoA
	ITt3Bbtr3V3s+ZYRiCV9HyqEJiwIB8FaECi2L3AURRG12qZMhFompUSs/GD/A3hD
	fpeS3xKZ1oGlQxW4lojcML8lXXm7qNGdn3fhv16mxrak5RyEO9RN7e5GmwkoX+RF
	rvrHBepwNW2aHnEBpi3Zmw8b+G54dRzL7YxfS5jm33aBdQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pab0ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 21:15:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5276aa86d00so10473431cf.2
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 14:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784668551; x=1785273351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sowKgixtqzwSBCQCBPAGJXk2zmqu0fqYx82mSkSVAfY=;
        b=NJElwJdKb/Pc0HLhLzPyedwqTIXyrj3Ya98Jw4fADGweg7wlGI0QOwt35oxwzrPIL/
         UqdO/8lV53e511Sn3NfcXrilJvyWD3y/k2bNX0hAxwS8H/M9jDKWgAuatXEHZ0INtI2c
         izQXYpLri7x6kJtYdPVcQ5i91IqrKc64W6h9b093z/FIK5jgAArZU5F1dg+Fo/3kcp1K
         ra7lHfHoiCpbkV3hlo8r8aZU9pOoTW/+1jcrzsPRiOwYZo/29OBn5I6gHBMoLOuwfIRl
         94xKiZn3hiiGXqOMuJG8jyi81sxeYzGBSIbObjW6MuA1N3l7UE7rtlXSPyeRQEDWzRSS
         j9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784668551; x=1785273351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sowKgixtqzwSBCQCBPAGJXk2zmqu0fqYx82mSkSVAfY=;
        b=bSy9Nhf2b99MB5T1yB2C25d08PhUxygsrep/c+1DEdTDDsO6Oh6hlAU8UlTxup/R1s
         qqboz5KMrvpGTL1BeMIknHCjWLXx1rbvv3RkhRRBIleNDPPx9IMfp81g3u+/WJc6DRUu
         kTE2PSijZYfNMb9kPyDMEtc0YnTx0egKBdkQvV0ib7BLy3u7LtpgLCyJvT9YjOZbKmUx
         eV3J/6UwvnvZsClcZNefMjoRvmxfdulaIv+jv60VNMU5iIQolW/7l8tIMOsEBW4LCXw5
         klLuqubPrHRtsjoVrMVDHQssRA5t5DZrSzGdKeFtlJ+A97DbKNozYhG0DaEQi4+WhQQ0
         QKxA==
X-Forwarded-Encrypted: i=1; AHgh+RogsIrYzf4dP+YWueTmj7Y62Do2Ua3tiRe/Nkt+QcBVgvOZ6uWBmT9KL+pGeMzCAQM4eC2ig7VVy482tw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8VlkSuhSsTXG1DeHrsqqDP1UMprAEkLk5juSxtOnPXss0n/A2
	FSVYIc1VWPwZlS+INchYaFh1Vti9xegzKYpx7tpY2ajU9yMGGQo7cEZjNwQPkdoG0kjSYvNT6jg
	W3BhiTd9g4BV6UXk7RE5oLTfPNL4SkOZGnYnpD9r9S/mqMiaUybFtrvSI6XZ5F6pNgA==
X-Gm-Gg: AfdE7cneV+zbxIBsvBjApx7+IsGQpw28Vy3UeCZCGg7S5nL3SQ2RnZuvc8eM6nZ9wks
	EwlI2+3jZ9qkO0QtZjWAXoyioKGxMA+yGrsj+C1vccX0zfG6jkhxvmjj5T6uMmEUvAg21ExZCmq
	jq1pZX7AfnXEX6bOwfHr0ZOJT84NQ30kZpJmIcQ++73JpmmFVE8AOwsY+9SZWvgu6A6u/n0Pw+J
	SXjYrH9mrVBF6rRntGu3yQX0yFfnWeFtSODUeE2ngSzLPBJrcoshlHag7hwraQEJ1ynRaZiM7X3
	M0Hi+4qCyPIAWp0SVGMfUIcSGW+bAoN5w7xbznHWVE/a6pyUw0GhwuMSjpUXxV+X2DUhuXR9QYJ
	U85fmD+WELIXQ52qYNhT/0i74D/8RyX3VPzFPZFKp6QB3ggeeSoRqbSV7myVYV15tmeXcZXs9Li
	YaPxuGbMKORn3RVA==
X-Received: by 2002:a05:622a:2cd:b0:51c:7b12:5fee with SMTP id d75a77b69052e-5213d4bc640mr183884621cf.74.1784668551029;
        Tue, 21 Jul 2026 14:15:51 -0700 (PDT)
X-Received: by 2002:a05:622a:2cd:b0:51c:7b12:5fee with SMTP id d75a77b69052e-5213d4bc640mr183884061cf.74.1784668550325;
        Tue, 21 Jul 2026 14:15:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d4353csm112784e87.57.2026.07.21.14.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:15:47 -0700 (PDT)
Date: Wed, 22 Jul 2026 00:15:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gourav Kumar <gouravk@qti.qualcomm.com>
Subject: Re: [PATCH v2 0/3] media: iris: add LTR and hierarchical coding
 support for ar50lt
Message-ID: <moj26vrjujn6ci74yrthdjyfdabg4tn67n7hczkeqvjhknm4ai@ilxz3c4jvcfe>
References: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
X-Proofpoint-GUID: X5t1EUKT8gT1dN3KcDiCTmxdyXncHMVy
X-Proofpoint-ORIG-GUID: X5t1EUKT8gT1dN3KcDiCTmxdyXncHMVy
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5fe187 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=xINO69gzjztef6yCAoYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyMCBTYWx0ZWRfX7kC4duJ7lHvh
 bhc/9LybBNjez6VPi5FR772FKjxlKFiEaxeLwY+0xvSps0Qqi7uuFROlU2CV2pXyI3stNoVLqMW
 j6rbujCDwjp3MmFNg0J/YCZKvV5Zq/82nSno4w46nahq4WObNvYsyU/SGmdlSbLjKqcDkToPWub
 jy2sCx/vsFKj82H7zJA570wJyI0TVjIjIwiq0/q/7KMXjBNXO9bcsb5f2l9pItMLDbRWa9Dq12c
 cWIyuQBCmfhXgxoopmxPCDTl7O0N5CJ5aiLFYt1evmTYboZ13JpWgSRudsEJRynyUEZTU9D7IeH
 G3BrTbAhoDEsIVpl9uTp0m90mujd871WQmSyfzgD/SYf+7jJrjWZERM0EMCUgUjW23m2oAfDC0E
 sIsQkReI0ctVZb6M+b3MUjVeGrLoOBpIQw8V2g261cjvkGoR74E5gW8OYLU0pbDdshp4qtH7Fs0
 wxJRdNhIshQaA6MH6tw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyMCBTYWx0ZWRfX3t/l+ksBlE1T
 2Yp94wxmGlRbC+V878rqesq1kCp9R+yTcctKp1cy5yGkR/N31od/pquMEam/u56B+xpT7kUFf9D
 3MdgsWGhrPytw/OjtKjRyOFmWpMuE7A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210220

On Tue, Jul 21, 2026 at 07:06:22AM +0530, Vishnu Reddy wrote:
> This series adds support for Long-Term Reference (LTR), hierarchical
> coding and request key frame controls for the AR50LT encoder by enabling
> the required firmware capabilities in the iris driver.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
> Changes in v2:
> - Added request key frame support
> - Link to v1: https://patch.msgid.link/20260710-shikra_ltr_support-v1-0-458b587268ea@oss.qualcomm.com

This should be coming as a review feedback rather than a separate
series. I'll incorporate those changes into the AR50LT series (together
with the similar changes to Gen1 firmware).

> 
> To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> To: Abhinav Kumar <abhinav.kumar@linux.dev>
> To: Bryan O'Donoghue <bod@kernel.org>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> ---
> Gourav Kumar (2):
>       media: iris: add Long-Term Reference control support for ar50lt encoder
>       media: iris: add hierarchical coding support for ar50lt encoder
> 
> Vishnu Reddy (1):
>       media: qcom: iris: add request key frame support for ar50lt encoder
> 
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 222 +++++++++++++++++++++++
>  1 file changed, 222 insertions(+)
> ---
> base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
> change-id: 20260710-shikra_ltr_support-27bd9a496950
> prerequisite-message-id: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
> prerequisite-patch-id: 8b5a1be5778fb4c7feb069452ecb60e8b8dfc3f8
> prerequisite-patch-id: e669517302297a7b315c9aa4f4189e4928091e0c
> prerequisite-patch-id: 922bc325dbd9a499a3a209d2f8dbbce6a4166e60
> prerequisite-patch-id: a5a49cda4e21d835558fa84f2f6bd25b8f7e72b4
> prerequisite-patch-id: e62e8285bcbddade64c026379f23a8c5ae70fe52
> prerequisite-patch-id: cac29b25348e2e791638a0286283109f2546f9a7
> prerequisite-patch-id: 4dfaff2f9644d7a168b1b35fe947660b8f464af6
> prerequisite-patch-id: a26fa49eefecf2b5ba6cf964be9327eb5ba5929a
> prerequisite-patch-id: d97c79463fe1487fa7bc9eebd4cfb4610713f44a
> prerequisite-patch-id: 76eafea8230160a3b5e6503c68a5c9c3c2d1497e
> prerequisite-patch-id: ea9cd9a8e6561321cd9cf338a76da1382ff47e13
> prerequisite-patch-id: 26e9083b709cc8f2f1184edf6b39fb89f365a9f1
> prerequisite-patch-id: ce4576bd3d20880939a97a1cda9bb8678808ea65
> prerequisite-patch-id: 8c94bec467b385c373bd98eb9ee5a5805fc4e6a6
> prerequisite-patch-id: 6e258cd475b77927d6476704cbf91bf48a63aa0d
> prerequisite-patch-id: 54c8855d0721ba8667d095e6ad6556c2021f89e9
> prerequisite-patch-id: f5479d2ca6b850c0c750944a8e0b05a7df2cc5a8
> prerequisite-patch-id: 96dfec1c2df69f748c1a4bd741628e946cb7bec1
> prerequisite-message-id: <a2c02dce-b097-4f52-80d4-d63006ebd8c5@kernel.org>
> prerequisite-patch-id: aae7aad665adb93ab0106c28420e34587ee82aba
> prerequisite-patch-id: a2b7908b27a6308f9919c986f8bde5b902e5d6da
> 
> Best regards,
> --  
> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
