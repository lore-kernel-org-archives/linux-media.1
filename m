Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9692D361DD5
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 04:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787028331; cv=none; b=QtRYQG8bcCuQC/M5mIJQQBYX2gEorE4+mUeV+B8YfQJReJCBa9F+ws5WelTRPeITp0nSe0EowBeUxcghBoGj0q6rSHzhBlccZTzBlopDZtMCidmrKY/3K6CHoTSu8ycyno7VFFB6Bf/M1mk6z1ky/0mXFTRxMB1gjjAhN6exI+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787028331; c=relaxed/simple;
	bh=4aUJK7VUOQ/uCRWZ29j9yj0ZivF1P99o5NOl3kBlKyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHqfgrZz9KMmZtnNS4munvo5NTKGZGuXZ9sCmoTZijCfoTvv+RgBQWPtBDlORtb2Qexq4Xc2bz/8cJymSVwfk9WRLmmIHBEUN+dHPuAHrQ5+E+JbTD/JmgCPa1uomtLA9wLyuy7FebpqBn703Bn/Ou2Po1VDyNLVJEfIB0/gpmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AZLXrhLK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UcQNZQuC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AZLXrhLK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UcQNZQuC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I3iLSH1171842
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 04:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+GMonc/RpYRTRb39qbdjpzhy
	wf/yWb6wWhYjSvEgMFI=; b=AZLXrhLKeOIaJbOQhN1f/mV6AmzKXDGGHr8sd/FP
	7A+yZhwyDyc8rsYV7paaj8MfyyGlu2+8FEHFBxB3FDNNe575kDViwsLOaRFA/Hkn
	aTx+Dd/oz1uZtz9s7Bs0vPRDMM0ykNJ8OrjZnOB7SVbgL8vi67NCBkpxcrXdsMCw
	lI6kJW9ReRAeujuzScXbbRs6M7hMEhzHGVpVVHLiqIjLfQ1dJAW3Dt0v7ZRziutA
	AP3P4MxLAFodKbVBWk+25KmxZ62v9kYY+6gFRk5Y8nZAtNJZCVALufyWOBMsKMY4
	vafCsyO1RxVJJrxpQ/VrLht+HPB9lc+PSnApQn6WOBAMAw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4frmr711-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 04:45:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9309af14fd7so348152885a.1
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 21:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787028328; x=1787633128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+GMonc/RpYRTRb39qbdjpzhywf/yWb6wWhYjSvEgMFI=;
        b=UcQNZQuCgYN1cEkyyf3mPz5FaxzvjdE2268T0sLVqqIQZv84uS+kl4DPzm8Z8sEUIh
         CTLblGi2o288ihF795T1DsnR1lpkLntUJR4b0zUl8yjp5utjFlsmYWJ/t0lnIDPVhaYH
         x7yYAfJ7q9mBrYZANYG3aZxz75YfHQ4DYUg0mNOjgihlW5HF2IsKt3lncvN0GaXFHRwV
         VVpHEZUUyzbZMqRM6uM5dIqHskWb+HlPjIG3vE7lOsBAOzZnNJGvQrPr9CeFDe1cplm0
         TG0lw34FG4la4yZ+ijpjhq8PvL28coywQn55RXV8jWL0pqq4XeT/qfUg+50t6MlIdhlx
         69sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787028328; x=1787633128;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GMonc/RpYRTRb39qbdjpzhywf/yWb6wWhYjSvEgMFI=;
        b=tE13L/fpQRcvPOD9A0ivKsVBg8jGDnZtiNkqPqy8j/9vR9ERZm7F5Ygxv4EqEqaG9b
         FSe4ZHdc0/iXVnq8qr8XvLICLKA38/hk+A0euCJ8qrqHKWY3a5wWc2KlW9F401RFAbBJ
         5mzPBW1C+8EnritQfbkHtjJ2XXGiLdxiR7oOPiGM7UEX2rmCMpIQp1e+yVMBeK/SLhVl
         xU3UvFrzGUCh/fhcsIXjb878ZwJK7rexMs+vO1q7/aW3ZlYo1LpsdmWIvdb4mfFlRw3r
         iHNJpZgThpvThXN4JVvvGbKvddJn8FmuQz9xJ2rIOybCEXTBfQoAXyKi1xml9lM7nZpv
         7TvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7JXx4QOa1MByVtiA+AbjcZcQs047ih5PVA5UVK2nRSxrL7LrX+lgRP2Z2pwCY4AAsc3sMEabg28KVrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAHRcJLTBApNKtQKMTnZeselyiImunJApahIqizUGK36FoYWzj
	y1jF75o0A5kOkYUVjXAqaZMwOD5CuNCHv8ji2E8H4YGeEVpfk74yNqIdLQM7zAG1ocaHlqeNcVX
	AEvuHQ/5POd12+XKp5Ua0G/7ATLA0iKKhDnbJhMpuIhiW8fVohi3quE5D43O49rUCVA==
X-Gm-Gg: AR+sD12dxYSXQ+i8hU/ZleHLus8Lw2x00xR1eJ2586ewHnH1oYXCIlcg9LizG3KYqQY
	CsPVsZrdFHXy4rOaMr+B4EGADJEgX823xH1GqTg3JN2aLq1Kd39Np+ecl2MPL9kFz9HeOrnBxud
	ADNzzqXxITh7Lq1UayF4IkL6LHlGtRReKSEGrTpkkn+NLS0vIYj5uLLjgrSgeiYBIiU3SQM2qgA
	llRRuljiL6TR4dVnaohvZsADWDff+ngOB6jOE6SATAY/yP7N2c4N8ksGuvIGEPo3NcWvdPFQT2m
	pAl1+0b3oa/6SvZc0lBzq9YeUy8DoLS7xYERqy5RMAiOv5nkfLK0TY8eV178QB9OneMKMEnJaM8
	Ydr2qyqME8a0DPtjFyFsz6RSCFDxd3fLUlHNYEMs9JOekK247YPKAM7+bQ4/+xnh8eniSF6Ifd/
	fTx+BjEBwL77W/
X-Received: by 2002:a05:620a:a217:b0:936:cf64:97cf with SMTP id af79cd13be357-936d239212dmr3033325385a.41.1787028328463;
        Mon, 17 Aug 2026 21:45:28 -0700 (PDT)
X-Received: by 2002:a05:620a:a217:b0:936:cf64:97cf with SMTP id af79cd13be357-936d239212dmr3033322485a.41.1787028328017;
        Mon, 17 Aug 2026 21:45:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cf960b6sm911796e87.13.2026.08.17.21.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 21:45:26 -0700 (PDT)
Date: Tue, 18 Aug 2026 07:45:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 08/15] accel/qda: Add QUERY IOCTL and QDA UAPI header
Message-ID: <bi3zx3rvebd4ywnyzhsu2ft2sqz3rnoblcgt3jpmyik3n4dxar@nnddlv2susx4>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-8-69a02e9090d4@oss.qualcomm.com>
 <r7bx25akbxomzhxxyqd644efy2vc65etwcnhlyha7wm7xrt7ea@p4v5sesn5rzw>
 <c54f5212-809e-4517-beda-f86b375c086f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c54f5212-809e-4517-beda-f86b375c086f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAzMiBTYWx0ZWRfX8Yyy1V2/Kk9G
 xcJKMefKiWq4h9a6LPf2HHBrE+IBBvFe6OovvV3MYB1rzGlr3RqSGds3HnP1Zc4nghPSGJC3JvD
 qm/B288vdq8bmmOXhf/ik2JCFDmZ77JAjUhqBSnETdMFGa0h2MEnj7DQTmJCCsm3GHP15zmvDAM
 V1tw4u/AvHJyrR71uz8eah5gulyGpIpsTMxVfj4/UHI0I4D227tA0xyrjjgMr5PW9xtjbHYEmvz
 EV8qPWTp2R4pHt27mzvhhYoq19CAUEdafFOfjFuUkrXKFjOn0NFOhpzLmM+PLfRPTumXNtd/KlC
 pWkEsr+o25dPdh98NlYwq3Nhv/OLANl6nFMLO52I9nzUKfyXkwiwe/eUpk50vVfaBqICyO21JPV
 PP/C2SsER1dVPgVoF1wIwb8G+RX9gRAz/dpQTWAis1pOZABB0xiRWrk3E5woRmuH1bjyA90GQZh
 KopR68cb9KbMbSIYS3w==
X-Proofpoint-GUID: y2ZGOJVqB1MaxMFtUfb0QoMVQqOgkeHD
X-Proofpoint-ORIG-GUID: y2ZGOJVqB1MaxMFtUfb0QoMVQqOgkeHD
X-Authority-Analysis: v=2.4 cv=GtlyPE1C c=1 sm=1 tr=0 ts=6a83e369 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=SJmWK-JnP90tPv7FAzsA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAzMiBTYWx0ZWRfXx9ECCxNhYG0A
 Kj3o6cQM/XWO7WMpUxTN3xa3S5LHlFuOQT1hcHw5bUZCt0yl5q667CN+++B+SlFkLfIUl7bSprk
 03vs2+ZRTikM+9d93mL+d0/65fvhyQM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180032

On Tue, Aug 18, 2026 at 10:10:16AM +0530, Ekansh Gupta wrote:
> On 17-08-2026 12:28, Dmitry Baryshkov wrote:
> > On Mon, Aug 17, 2026 at 10:17:43AM +0530, Ekansh Gupta wrote:
> >> Introduce DRM_IOCTL_QDA_QUERY, a query IOCTL that lets user-space
> >> retrieve information about the DSP a given /dev/accel/accel* node
> >> represents.
> >>
> >> The IOCTL takes a query_type selector as input, so it can be extended
> >> to return additional parameters (capabilities, attributes) in the
> >> future without adding new IOCTLs: drm_ioctl() zero-extends the argument
> >> structure, so new fields can be appended to struct drm_qda_query as
> >> long as they go at the end. The first supported query,
> >> QDA_QUERY_DSP_NAME, returns the DSP domain name (e.g. "cdsp", "adsp").
> >>
> >> The UAPI header include/uapi/drm/qda_accel.h defines the command number,
> >> the DRM_IOWR IOCTL definition, the query_type values, and struct
> >> drm_qda_query. It follows the standard DRM UAPI conventions: fixed-width
> >> types, a C++ extern "C" guard, and GPL-2.0-only WITH Linux-syscall-note
> >> licensing.
> >>
> >> qda_ioctl_query() validates the reserved pad field, dispatches on
> >> query_type, and copies the DSP name from qda_dev.dsp_name into the
> >> user-supplied buffer with strscpy(). Unknown query types are rejected
> >> with -EINVAL.
> >>
> >> qda_drv.c registers the qda_ioctls[] table with the drm_driver so the
> >> DRM core dispatches DRM_IOCTL_QDA_QUERY to qda_ioctl_query().
> > 


> >> + */
> >> +#define DRM_IOCTL_QDA_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
> >> +					 struct drm_qda_query)
> >> +
> >> +/* Query type definitions for drm_qda_query */
> >> +#define QDA_QUERY_DSP_NAME	1
> > 
> > Why is it necessary for the userspace?
> Currently the requirement is that on systems with multiple DSP domains,
> each is exposed as a separate /dev/accel/accelN node, the library must
> query the domain name to select the correct DSP to offload to and use
> other dependencies like shell etc.

Commit message.


-- 
With best wishes
Dmitry
