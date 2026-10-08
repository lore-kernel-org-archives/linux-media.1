Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED104503FB
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 11:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459345; cv=none; b=WYH+SQ1N6A7yOx0MxxIvAd3yRrUPNuKFqoHZmty4+M3sxy0OOJdheGqYbgIKp9n6RK3KMquYayI2GLutK/Sf8o68w5rGshpsKqWQhWbmSqryk/9ZGSaWg3fhuuq98C69mkg8nciojnGaVcc/+TGZa913DP8tggcLaHd9EpHBeJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459345; c=relaxed/simple;
	bh=rwWhjJygeBF8XRrG4xDSZx4gG4+AktM2mHlK8yumXmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oyyl/n1ZXtjSkqfebODBe4zfZLqf3nbOI1iUJB6umn2yLrpHGzlJIbEshMRhxxkZ+yDl1V+NmZdXn05tSTID53CiGQhjMWd0adM430gHsaQdvx8QYoaKRo0w6aaPNLqDKzf3qXprAk3M1h3HdRd9j7cLRaoKmP3CbC5R1nwVAjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXvqAvNj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LfT67SBG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXvqAvNj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LfT67SBG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKBEQ2604169
	for <linux-media@vger.kernel.org>; Thu, 8 Oct 2026 11:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fN1oRv6rGdX+0gnFTYgpfMvfvkFbtEGtTqLBs1YULyM=; b=lXvqAvNjspEXOLFq
	68EW4uXZa1Ie+kUDBp3Mt5gLxZyDeAnO8+yU/5G2WYXvIo/+QnvOpvpO0PJx54sA
	DUOsq63RYpAX6gBHrBGwxbcVtFbBAHODORXO7L+IH7I2mh3Ul4E55k+Ezi18p72F
	rvGhP3k2q8qw+bWb7YmNY3dp7M3w5B3x1TYeXWMBLmhky8QMfudNRzdjqN78seuW
	k7Exb5r9VxE1Ei22JQE44q6pjyP2o4hNTCJcABilvrjtP2JQID48JLa48BGTYwvG
	H4+9jLKd4GJo6+piaXSmASbpW6ty7coE5c9DUTVqZ/lqvrIi3irx9osM6mzDJFv8
	n88AtA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jp3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 11:35:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e46b4b700so881632385a.1
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 04:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791459342; x=1792064142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fN1oRv6rGdX+0gnFTYgpfMvfvkFbtEGtTqLBs1YULyM=;
        b=LfT67SBGpASerZr0SeNKwXrroYWcRImPL8f2AYbNZbVXKW40Ttu2Jz3ZqtsODlNuVY
         jkd4dqF6UnKZINIJHZ9Sv3p9mR5mUbKjxNlr07/F82N8w1GFI5uszBc9t882NgnSeWhI
         xfUMBmcQYs7JYLjZjOX53tSbvhcLF0upt9zLf4qQ/Sw+RGZfhTeJx40YhduvPL6ZO2eq
         46lKmeIA/ZWOuAZ8duLR5/EHWtSRPkOWu2yF5/a0219/lTAAYTtFqpyHL2dhna7tTNF1
         4/WDlHk700Bxeob5bj3RreSLq8u5YiZI+2eL7nu7GSZYvLcxKYzniP4JTjdXubgmXcVH
         eEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791459342; x=1792064142;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fN1oRv6rGdX+0gnFTYgpfMvfvkFbtEGtTqLBs1YULyM=;
        b=UCPMrR+1YChG4PF89YioL2nM/NiP71D6CgZxjpUAhMAVThKevhmXUlxVj5UR84nGdE
         mLjBUyowLvYlK4QLCyYoisZZul9MDN92lDL3BmPagsxMDMolVz9ZoyDuowzhORu/BAVy
         LPjPgxWZTk6G4u1HqQmhImQ6WXFfipf1p/Ig/yVyZy3wq0JXN8+0nQ1RNQWirPBuOeVj
         8QTdvGSoKEN3mXgVOnC590if0glg2ccc8LY/KMtlH0eeh81FfYPf9kq3wzPATlyikNXg
         pQqFZ6F7R/Rv88/MgxwX0c6R4krPlFKtQQwS6Xz2wEmvBhem6R1mS0fFCn6H3blUn6VS
         Mbwg==
X-Gm-Message-State: AFuF++lB8u1j1CkXOV88RhLzflnVWX0AAnYL6PsbEiRg5d8qPnXd9UxH
	mAbOd3NrXxAgq2tv2gv+syAEyNN1jwnXzojdAQfm5ztftdjPN0RyWY1Dw5IGFV0scEBvUqcwfLF
	QNmQ/esND5nAmBxDHapCP4rulhe17YOgeZShm4DpcAH/dqG8xmZWijkd9r/Eo2/ockw==
X-Gm-Gg: AYBFou18jj8eAXWPD9317cwNGt8reVQaJD9xfLxOIYwf6ENsmzYVMuoOH72hgBKZG2j
	VU/+bL/9HV6LJ/t04lZCtqkV2Ju+SboBBmewNlUImDXOCB0pbGQjDkixNNyHrd9aDiWXilukgob
	jrqPVMwhy9NEQMDiIuy+neeVAnh1gFrkJ1/sGUUtqXOOhbwVG9p0xgdQhhs8Yj/+TJg0mwF2QJJ
	DBBmjndN1XJM+YrEcpMMvc9w47vB+y/uTC3DcdPb6DXaY5UI5pvCt4SmZGbtpicDk4lq93wTA9i
	YcSDjb4eaKf8HTVH7AXbccl34egJ7h5lg8C9kQ7BQySb+5OjhEGa5Ls0dUuVuvcZXOc+7uVuBR8
	+Il+pCxkLGp7ykSBdNzHrXrRIIbAPEwKYfqkQRIP/
X-Received: by 2002:a05:620a:198b:b0:93e:9809:8388 with SMTP id af79cd13be357-93e9b895a5bmr1041750385a.72.1791459341851;
        Thu, 08 Oct 2026 04:35:41 -0700 (PDT)
X-Received: by 2002:a05:620a:198b:b0:93e:9809:8388 with SMTP id af79cd13be357-93e9b895a5bmr1041745785a.72.1791459341229;
        Thu, 08 Oct 2026 04:35:41 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c75b4e399sm9891941f8f.56.2026.10.08.04.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:35:40 -0700 (PDT)
Message-ID: <5e19888d-d037-41e8-a3ca-f92d9991f3d5@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:35:38 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/74] media: qcom: camss: vfe: Define output based VFE
 controls
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-25-ed985aefd611@kernel.org>
 <307f12f9-8805-4b3c-92d7-422d994fdeff@oss.qualcomm.com>
 <0d1c5d19-68f8-4d44-9efd-f7d1aeaa7b32@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <0d1c5d19-68f8-4d44-9efd-f7d1aeaa7b32@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac7800e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=HyDj4FpERjvnZyVuxHIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfXwCIkA4djTAPS
 Z5IyOgovP45O7POozXhQ8WWkOCWbYXstr52LAvn88BuncuOA3kjwSws1Uv5A7Gil2FsgWo5FDZ8
 PaeqXAULVay20oR1ovFppjJ/5EaZZ/Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NiBTYWx0ZWRfX+/50oE5pvbTo
 9jRTfH1QHwGqdzc6yGL6T5vUyY2mb+x1PaosuOgK69kYn4KFxVKNbfD7X/qzKG8PZjT5CFjgP9F
 YSN3SSPxj35Ms81ljtkoC2NJ9WBruSdGl2cv6vi6GgUQ63objh3o0X9+Q1PfDD1ewomMUB0N4rw
 3MgHmQvAlh4KIaIeB1zxcmhZ2fFo2+Q/yJq6IwVhlPvb9Q3SunlFQOAXcOR+wUcTVFL8E9iDNJZ
 9bpZJVI18iSLmYtaSGZnEeFseNybm+pyC9GwXkDb/1hthKL08CzG3QMLFCYtSAcr5WDFhXgz+Qi
 RLEcWeepRLrujcGIbVdRDZu0Em8eeDLqwKxImZ/nWVVjBR7fPkEyIefMuVQEAHmrJYXXfkJ7CK0
 77GYIJY8G93x43f+DfIOc12qpVUQ2nD5UZBM4CF76/bzCzpPaX4sSWUg8mijPZG1jhF0Sh7bu8+
 4W34r5iQrjiGwPalBag==
X-Proofpoint-ORIG-GUID: cRBkjN77V5EeY19WIIfuJq8RjBWL0IfC
X-Proofpoint-GUID: cRBkjN77V5EeY19WIIfuJq8RjBWL0IfC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080046

Hi Bryan,

On 10/8/2026 2:17 PM, Bryan O'Donoghue wrote:
> On 08/10/2026 06:55, Gjorgji Rosikopulos (Consultant) wrote:
>>> +
>>> +	/* Output based API - new and shiny */
>>> +	void (*vfe_output_start)(struct vfe_device *vfe, struct vfe_output *output);
>>> +	void (*vfe_output_stop)(struct vfe_device *vfe, struct vfe_output *output);
>>> +	void (*vfe_output_buf_done)(struct vfe_device *vfe, struct vfe_output *output);
>>> +	void (*vfe_output_update)(struct vfe_device *vfe, struct vfe_output *output,
>>> +				  struct camss_buffer *buf);
>>> +
>> This also deserves good commit message, this is exact copy of the other RDI API with other arguments 🙂 Shall we migrate
>> all existing drivers to this api in respect to use other deprecated API but having both of them leave in vfe file which
>> creates even more confusion and readability of the code?
> 
> Ah but that's the point.
> 
> You add in a parallel API which is 1:1 but which can be extended to 
> describe completion groups not WM indexes.
> 
> WM indexes have always been wrong - limited to RDI and we have all sorts 
> of spaghetti code to work around that indexing mismatch.
> 
> The fix is to stop doing that so yes, implement output / bus-client / 
> completion group - with wm and planes described in the output layer and 
> then move everything to that new interface.
> 
> Including new submissions. The only real barrier is finding old 
> hardware, making the changes and ensuring nothing breaks.
> 
> Since there's no DT dependency its "just software" - easy.

You are maintainer and responsible of the code. But i also want to make the point
again (which i think others may share) that having one vfe core code which is trying to support
different architectures of the ISP's which are quite different is not correct, it is match easier
to have different implementations based on ISP generation (different sub-device) and abstract some
handlers which are shared. As of today camss vfe have mixed interfaces try to match multiple
generations in one implementation. So that said i will not be convinced that the direction
which camss is moving is good. However we need to live with it and add support as you are
proposing, so all is good lets wait those changes to be cleanup and we will start re-basing.

~Gjorgji

> 
> ---
> bod

