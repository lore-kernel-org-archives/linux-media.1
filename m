Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232C73FB7F1
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497826; cv=none; b=oucybMrPFpLrfVF8D6a9jpBdql5KwHfoAs6gsM8fnvMsI2wX19mne/pRa9qYlcKUK7lWZWyA89FxDtVVXdpSIC5lgT807wBmCSLp0HaZFeCR0HjPqFALTQKwquyx2zs958DK/3QPrBxa1lLuMr/IMAx9B5lDT/V5riAdNp+xI8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497826; c=relaxed/simple;
	bh=vV2SkM0yNJjd731dpBt8g2sTf775LbK3wbwLSPbDh/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Si87xFgkCxyb/v26r1hu+PwMYthpgS97Vx3cjsUupBkuYhUKYPCjmcG6bF36tFTrHLUbohIr5S7h4wJ2mn+s2tZ/hw2+p3tuqPIOrTtGqh+Zr4feXwdRpi7lLBeI6gnb3JOq4xKf1tNGa+uCDzmU7p3wnGuBB5wtdV1inoNa+yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+qmdY0y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X5j27Gid; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+qmdY0y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X5j27Gid"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBMJDY847905
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SV79Lg7diCi5lX/hgaJG1o94pxC1WlFKHg1QeOlGtrc=; b=S+qmdY0yYBo3aTnR
	syEnKXb89wqsWwXTqctsIQwqiWybT+fzS93WyvksXRG82GFGl+WSpkU3QVknDELL
	UyQzANkUHHzt+0nms9DzOewIt+V5W7Kf7SxfTMGV/IhwbRa0NicGfsKgxNOzrLbL
	RbOROJJD1WFaR1QdJqdQPd3qvjBrY4BkZBddgvBo9M03+xyvwlsEXYNUPMeY29HO
	yGhjcM1U6o+isOz8rOv0JkF7CAubSmlMPij53dxGtCz/Ybf6wIecXhjiBkOFBGiN
	XEWkd2rYAHjgnzuZtQ2BBWyNAEw6GnAJ3I8RJbw+/1H6qWnbaAGKVbGZBlUxSCYV
	K6KXdg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frtf2r4v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:37:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9058a836724so2126526d6.2
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 04:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785497822; x=1786102622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SV79Lg7diCi5lX/hgaJG1o94pxC1WlFKHg1QeOlGtrc=;
        b=X5j27Gid1T4fo5yeSd7Q7iwD8idKDnMX0keGwvdXy3aPFQc+2+vaHawuBgYMw+H97K
         gxMncf/PYebESNhHRwb9TdTcjvDRuFEg1FPPl5kBWPLMBtK8VLQW2vGevRUvb5pxa75p
         A3c3+v+zUrYg12KCny0D0T+hli1B2ZK1FBhzXtnnW1PAlKR7iCJU/bNlfSyzr/nI+yl/
         NQmllpI6vdsbNjf4N5Yu3rtda7Ig538b3qTi6xdIpJ16VQp8B1AxDMmrlJTnQ06WYatJ
         yHYJmu3qP/smsaSiUoyKf1rDvdWOJrtF6Mi9jJkewgYGCMMPWwsAx00KTOFzYyLe4cxF
         9O/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497822; x=1786102622;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SV79Lg7diCi5lX/hgaJG1o94pxC1WlFKHg1QeOlGtrc=;
        b=VGO2v7t0Kev8couaJqCFv44v9Z+HvE3he54aq4R05wY/Cw324t2myNy7DOD03HsCJx
         nQX+dxkpgpJzlrX9qNtPV8lBNnldATqgZulJcQUurV6ZlzuGYNt497I56BreVayzQao+
         1APWBy8GVKvxxz6xEJiJiQd/w0gCBTiMAY46de+86prctlplu3UuQ4ejgNbfabhrqapP
         4VZDlLIyt/902jbqOAApE5nUcrr1q/oQhQYNxIRY/GI3R4yHEkMvSKkRGZF9QKrIOWsw
         5nB2yicbAgZ6DHetUUm0ilfAfBffZTUiJtQqxxSMoe3x2z36CpOefiO/Oa5Iauqv2DA0
         h5mA==
X-Gm-Message-State: AOJu0YxHj83poN5lP6ZXfk+qUFF5ipgqafL9Ol2aszCRWyct/ne+ftKk
	7v2+NSw0ip3YKwB1aj2QHJYWPrHiShLrd60M26yF0RG3KEHU5ToA0Ru8ZIoXzAN2i/DuYmgl4dw
	IaERttL1nUKSCATKwz/QGMaCEqrBOZjpR1we8la6kVABuQoTM/Q5BI+xCghnyefOgww==
X-Gm-Gg: AR+sD114TpoHS5FgsDVmsonihVE8k2LDbguX9qNxXXoiZKQYFVeJH+VKYgTcsUqbSqo
	bDpoBu4InSI+SYk7SL85jbEn2W8aI4DOcEODgM0B3QiX6NNNT3cMzZk5DT6+J9xY6pXBWGT3e/P
	o2S9jcqsJyf/8qx6nCuGTtlGu6y4hwteT1Nq6mlr/Sr0KMUherEXAnhzQjXzTN4OFmyOg+WFgU1
	GE/qQYIC7v0BHHBSqKzhqWYRtzINtIiHQ6kJvEKus1gXL/cnx4HibjijQ03TOyDK49X+g/2Ivyw
	sioZJiRr6Z7vc+pOGTofr7M8vvgqVCxrHsrj3oPRzZFIQVw4uVqJ5aoQDi1NEyTXVqV0fD4GOGb
	OEYNEHdsXKtR839jQoUlJeqph
X-Received: by 2002:a05:620a:2684:b0:92b:55d5:ba3 with SMTP id af79cd13be357-934963bf85cmr199627185a.0.1785497821980;
        Fri, 31 Jul 2026 04:37:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2684:b0:92b:55d5:ba3 with SMTP id af79cd13be357-934963bf85cmr199622985a.0.1785497821095;
        Fri, 31 Jul 2026 04:37:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c93a87sm125439266b.18.2026.07.31.04.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 04:37:00 -0700 (PDT)
Message-ID: <234116c1-5e19-4365-9b3b-0dd1ce64d972@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 13:36:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] media: iris: fail firmware boot on invalid
 uc_region
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260731-iris-fixes-v2-0-94c002016a09@oss.qualcomm.com>
 <20260731-iris-fixes-v2-1-94c002016a09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260731-iris-fixes-v2-1-94c002016a09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _f7lXWbAvTXh4sBCrzsi2BrDB8cfQhLc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA4OCBTYWx0ZWRfX0J/vtlXUMAak
 rd8fc9K6D/bYYWPmx3CWH3u1PxEqNSnttTdd5qy6OilnNdSTNUKr8OISCM7BaPi2MP6pTqWd0zS
 cIRWYeo/qWvGUrJNV9IBhMOJtOS5mE8=
X-Proofpoint-GUID: _f7lXWbAvTXh4sBCrzsi2BrDB8cfQhLc
X-Authority-Analysis: v=2.4 cv=ddKwG3Xe c=1 sm=1 tr=0 ts=6a6c88df cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=M_9emyDH5AVLG-PN9cMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA4OCBTYWx0ZWRfX84GTgIaqhhl1
 SNVnDareaw/+OTRbnze+EL04/65mLMfgZUFPgV/ZZGSksQwq+0FA7JZUSZBd+7fu4DFuDIyviYP
 e7BBGVL29I6XgYzeQgiKIV3wzwo6gB2q+hhNwzGeWmDhY5ycTy30lCsbXrnRjknbKP2F7icMyt+
 TDIoK1eWeNDKIRThmN+WnajXUJIzCUf/zohS7L1KgfvMAD+jkm2oeMzNN+8KiqsAonaerTW6yYs
 T7mCYP1R1XHleEFkccMTyjjYZoiTbSe7oO+qsv6cDvnMZmruOWjSIptZgVKvwuWIsohd2/FJ1Ie
 cb1a9367dNyZjoCxl96PNinTZRSBH1l3wWi0F+HP7EsTlz5Y6ZOUSsVEmA3Bqnvz43/Se+TMxF0
 JnUqw2+9GNB0sIOkw0gB4wcw1LnFKB+UUr1wCEZUohpotCls1seX5nvwlBoAW3N+MtOiYMocXbL
 5jxRXWP4l+XeTEn2aqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310088

On 7/31/26 2:31 AM, Dmitry Baryshkov wrote:
> iris_vpu_boot_firmware() polls CTRL_STATUS while the firmware boots. When
> the hardware reports an invalid uc_region setting, the poll loop breaks
> early with count still below max_tries. The following timeout check
> (count >= max_tries) is therefore false, so the function skips the error
> return and falls through to return 0, reporting a successful boot. The
> caller then enables host interrupts and proceeds to use firmware that
> never came up, which can lead to unhandled timeouts or hardware hangs.
> 
> Return an error directly from the uc_region error path instead of breaking
> out of the loop and reporting success.
> 
> Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
