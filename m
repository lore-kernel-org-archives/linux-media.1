Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B963F65EB
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787564773; cv=none; b=kXICGV/d+WG31CMiD2F1lruenUfhsSZ8mMu/Okd+Ce6ViuRbAzzBDa9f9Nn6CbH85+GiW9EmA88gYmqaqD06eiCVHBbcfeGSgNLAcGCMNeWNcwrCDJybCqohMbFhyLFiyLFa+5xBihZQdAnqP6n0NNUDVsyROc84XaiTMqCPhbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787564773; c=relaxed/simple;
	bh=/RGfyliEUANaO658nqDO6+n5k5sqCSVWjr4Ade1cf7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mvz7Vih/GntLXtaqYxW0tR88lpcQdnUxtPx4u2u8Z5Z4tbq5Aulkp9orMC9K1nD2GlAJrjkSLk5ImtcDe3aFjCSwB66RFrLuIvXQq4nWeB6use1PBqdndLnr63BiItjT8FzaoJfwhMPTKkJ6wKvpn8lSmWtQU7MZLlfsgFZC9J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvR8/Ayg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=efub97+C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvR8/Ayg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="efub97+C"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O992Dh2448604
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 09:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jPkYMwpH3T9LJMuYXSpWS/SaNpZEHk1LI9FfTb8V1Uk=; b=kvR8/AygV9gO21y2
	I2R8CqukLcGRVPn8I8EPKndDknVeGi+gtNr3GYKYzJrzj7AUHcBKrRxgiqewy7vK
	h9hnbSxjYrnXCrZwRw9YMf9/u2XSLkH5hzwhpEQhXjEnEp9Uffzx/YO3Da9ETGQ5
	Ht5Ce6EKFDjAgk9rMhs5ztNKwVHFa8zu/V6eGHOw9Dp0pQGwbMA54qbbBMoJ9+T7
	MH9kJZrGmV10HAMfenQCxOnVVchza1CN/j6juESLcGz/YTEF39rol8hSbNtBhDt0
	UkE5noOHlgeEe5pc/wfnXRxW25YF2xWxpMmluI4SWmCwBJfnrpRXFnnOJdv7dBxb
	m8/17Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r0ft1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 09:46:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936cf9b6f32so22207885a.1
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 02:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787564766; x=1788169566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jPkYMwpH3T9LJMuYXSpWS/SaNpZEHk1LI9FfTb8V1Uk=;
        b=efub97+CpVsxwKMZy0dlyDtABIJod4YVEHM1TprbHjNIYsDyhx5P90iBHmk/AL54IK
         ewzSnu0TS0vhmIV0w3cx1tSTjOCkEw6EBGz/M4pHE7xBFtDY6GVdjJ5VNPxQrg1ZffOZ
         TVfG87SzJteRUQShiaL4NFfxDcnU70+WPJmsFQUIkqh3z6z2sqy95qlrligLalfozjRv
         EaKNJqzjKi61En8grCiniPvjw0amu5+72SPQIyP0q9Pttp4meWl1olEJSZfPocY62Eku
         E5gPP2ctcwJikUR9d/yrIZi3bfW7XyJDpNPejuk3Q1hykiZAHZAjW/+yqeC9ZJkt0xEI
         oLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787564766; x=1788169566;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPkYMwpH3T9LJMuYXSpWS/SaNpZEHk1LI9FfTb8V1Uk=;
        b=cpWBVEANrDIT71j4TGR6dRhghpKeAetCvYss1r/YweUPsRhHfeoA0ZawfAbEKNzEKv
         GZJg0bM3akikhypxfbT2R00CCWklGnkbXCxwpHzok3fSWPQ0FcvBQTdVETDbtrVQrTYW
         wIq7uzpRzm1H+8nj7GHwQtbpBz84cQOzD96T/ZQbBEQrqT6C8GW8p2hQfqVtnpeHsHoj
         fnMVltDv/TVfitcQP3t6+w2n4p8el6kW1oSMxKN4r5LoCEyxiNpQBzzXnpfRrfwKXqQm
         EKbXHADnXTaa9niuAfFn4TouC4lC/To4rv1gL6gjuftFqTlEfo4ZltlNOPlGTa+V04og
         Iw8g==
X-Forwarded-Encrypted: i=1; AHgh+RrY8VBHRrpGQk+V7ziBLMeWudE6Df0z2E9AbooT3AbJ7LrwffOnDiv/dU8AI68nAkbz/RUIa5L3oUjA3A==@vger.kernel.org
X-Gm-Message-State: AFuF++lyaYmPiPSNNhJLM8QLyUTIu+0LBaQpirhr3RxrBLd/dTmT618z
	9nc3scb2LWyQj4qbbuWZ/4h2ZbZfqIqmSc+U2JfTUgVR4CmHGJqaP1vF/qjFKoyqDcy4LIDUmC+
	n7s7oIGAmp7y8U6RyE5iH5OFzVr7MfP4hClJYJICIznoAmcsGOzSk0NYz+S8i/KbfgQ==
X-Gm-Gg: AR+sD13DsAPVROrR5H9Lg3tEHE5PxotjXW2ma4+fY8SwLGfV1Onm2j4yW85Edi1+410
	j2IGXUrYzqwVJzmYqA6RaFPK0WVw4o6iVmSq+nu6+hiyXJxzs+YkpWpbHzDtttKWKzhuDbHqlpC
	ugT2b3IntSDdUNrhg3edIUIBY1AqmMnUmfX2DoseTVcoeJ0Kt0PfteuCwV3LAXK3mkgWZPzcoj/
	E4uZj6L45aVNd29sW5wrcYBvUfFYSIEdCKAxMxSo8QZqlaBFz4+d5mULFYnggRcmS7+fssD2KkV
	vpyJzf+qcaCgxhwSsWpwlUindKV+zgPHLtsg58DP36XWST26t2mYf8wfQb4o2mig2TiCqJvqEWE
	Zz/WFgU463+p/43zOIaL18uk3
X-Received: by 2002:a05:620a:4728:b0:934:95d9:85fe with SMTP id af79cd13be357-9373957a356mr1703823685a.3.1787564765808;
        Mon, 24 Aug 2026 02:46:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4728:b0:934:95d9:85fe with SMTP id af79cd13be357-9373957a356mr1703820785a.3.1787564765402;
        Mon, 24 Aug 2026 02:46:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966fa8aasm1256229366b.34.2026.08.24.02.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:46:04 -0700 (PDT)
Message-ID: <2aa0e4b8-c22d-4dd9-bd05-00bcf9cbe736@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:46:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony
 IMX576 front camera support
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
        sakari.ailus@linux.intel.com
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Tarang Raval <tarang.raval@siliconsignals.io>,
        Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
        Kate Hsuan <hpa@redhat.com>, Xiaolei Wang <xiaolei.wang@windriver.com>,
        Walter Werner Schneider <contact@schnwalter.eu>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Mehdi Djait <mehdi.djait@linux.intel.com>,
        Miguel Vadillo <miguel.vadillo@intel.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260806120216.24145-1-himanshu.bhavani@siliconsignals.io>
 <20260806120216.24145-4-himanshu.bhavani@siliconsignals.io>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260806120216.24145-4-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4NCBTYWx0ZWRfX/pz6XdOALy/W
 OnNo/c52DReGtPmL8j96vvq0dcjSQlPGXQBHym+KSpRF6+NhnCkMTu6jiYoz/NES+tGkH3lfwRi
 0W54dnty0KvIXgGxL4NiFOofJdXYI8I4GX9apxAf18PTX/MUlxJB7BOePEzFMse+ijk0PZskpdE
 7jcxbnsvbc5w7rKLSuyezBnxSgUcROU5TD6gLff5mR6mx1jJ3Iyv8h7qGimCDFsbLoQw0KtPeb5
 Pyk5HkbEw2m9WppbDVat5FKIUxUW+4OUsnkI2fbtPv+uGsV+rbbIPlrFBA2YbdfSo2HeGDIOVKl
 42htPI7g/rJ+WJ6o6JYjGHPs76NMWgeFuXP3hieDUnyxC/ktOTABbL1RHCBuC80+/9+A2nJhVQW
 Rvx0ey/zpODVi91D6OdVGltWumRQBKAKDuQwJNbf4C2lmDrZIvFrTyVoXJjf9plxCFDUox62okt
 1BuHo4GDZzzivpl2t3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4NCBTYWx0ZWRfX8e6wMVCKEl3/
 WlIeuwuvHVxGINWNI0YhdomtODWohFpDUNguEbEHxPcxDkpJkcMPN46DUO0e9dEz+m4U6WgfJiP
 CdbjAlWujtU1kPMEFNuT2mH1GnSX//M=
X-Proofpoint-GUID: kaAN24rBzS_rlfShNdKrumh_r1N0w2WF
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8c12de cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_fYl8KkWePwGJAbRzmcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: kaAN24rBzS_rlfShNdKrumh_r1N0w2WF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240084

On 8/6/26 2:02 PM, Himanshu Bhavani wrote:
> From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> 
> Add device tree support for the Sony IMX576 front camera
> sensor and connect it to CAMSS via CSIPHY3.
> 
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
