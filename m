Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358D25221C8
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 12:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068258; cv=none; b=u0Mna6i9XWa8mnKi47Nqu57NfIgiPER18KMM0yNo8EvPVJKtLNIU/KR+IWBGjKjX+nx0Y7f+kV7kyg0bE//rFwDEgdsuTkTh9AiachSBqXpfz95zQZwCHq919dsR6lCTX8lB+qm4jsuqQD+KhU3LjattWvXNPB3gVCVGQtYQ/Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068258; c=relaxed/simple;
	bh=S3MW9H3wgEOvPP0uhKYDeITR4aJO7iujGxWR+LezJgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvqV/cnQUJ8nZ33PqRv3Zp28+iCnazhcrtzanHlHgLl6oaMvDNqGk1q0k0QIlp5SXqF4TDA22omoIkjLVHfW+rpiEpPDYgzfVoScSSRcVHP/nLTg47odKNvBx7sLP7QHbdc3Fo7WTvF/hgotP+wi0sVdFfD8bZ9R2ueqAv6ygUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+Ke54Gg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XVBom2Zm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+Ke54Gg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XVBom2Zm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTSZ2809292
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 12:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w8o5JafesiRvwaLb/g8OOXSj
	6qim+o/hrusYm3HaIh8=; b=O+Ke54GgUCNZs50ieolXqxwKWZv0GIbzUBWi/mRX
	qAr6Yc9v7NGxFfNxuj1qm+mf68ZVCtMHRN/GHTRMJQiIoKc8h1h84O3NW2NiiT2R
	wLdLcB8PSbHwQqJoTa3n00fLvxuYQ1WxSTJdTbHfVACOEMIJMfTL0kI8f+cId4Uu
	Ofom2YTbY9cCqIN666IL9KBx4fbze9wANQhw2i/msJHFhBaVbRBac+rszrbYC8Kj
	3pL7HzIWeJ9b4zWstuSD75Vu3okjf8sdEngWm5Dyc+K8H69jlyzuQpNzOU38trOO
	TUb4BmS1X2z8hfsvxeljav8v/3aQ/PKwsB4izHosZsRD6w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54tkvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 12:44:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso24311756d6.3
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 05:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792068255; x=1792673055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w8o5JafesiRvwaLb/g8OOXSj6qim+o/hrusYm3HaIh8=;
        b=XVBom2ZmD/1y50izbY05mj9dvNeZF52ZBAk4lCRgOcgBXBB5Hd6vn3XuJgzSj3EfU6
         yl5tbra85D8F88WRjDvPTukLTMBsrTGqQ7T9DCSK0lX01nyAhimxH3bp9XaU3dapWnoh
         rprdlxYLVuxC4GanghTEB9sPhU6myNtAPWg3xvPxBPQIIByWdhNYKssVx/io2kcamkRP
         xFzAoWSJatgtaorJxyzunP+doH3lxfx9UeZ0NweQDRDlFYH7mTK7BSs6pBTL5e3aalcr
         cPCJuvYtqJLIW5cOk7FRXmL2PiDhcJpwOOtNHmyC8JDsEaxPRpW+dy05ifaB3KlWYi5v
         yAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792068255; x=1792673055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8o5JafesiRvwaLb/g8OOXSj6qim+o/hrusYm3HaIh8=;
        b=KcPub2gYMyQsFSV5Oasvz5gaNxbBPbE0uwWKBFeni/F4WVg1omxBSSFbqKJeD2tKnB
         Q5S5PG3tl9WzZfOZqdmiu5kLOVxIWo7oU/R9X+4qPbkX6mpgGIVQ7HaqnZ5vAeuJK2S+
         aVKCHRc023TTQbnh8AtU5XSWCZxiNkUn1IJmpnSCSO7ExeLiXW2Xby6pnsa2vNUFNSmp
         vByGJgXICvg8bHaR91wg+JbuktxQZmMiMZh0Q0wNaYl+pWLep47doovHCaZZIKj8d2OJ
         QHnEU+PqzIDS8MVLMxxWQBlgyRAFb3GRu8N6rpKjlGst2CFgI7SpjSmLw4Ag3alOI/mj
         weQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxlqtBjQTxLqHFblRycHSxAjnjPI6RKlTjbBygLJouaOIyLeOtvETvfSS/cAMZ2iVv783PMZpbtnaz+Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIV7dSpBc3jtI/BiC4xCqNpNvOYNvlsOBKA0JpQTUK6/00hgjo7
	5QAoHISDy+Wd6qSpSUMUIVAq8uIamjXq9cGcoDpjlKHx2xvtCUZm0Fb1ZRuC5Pttg8ZcVuEsPG7
	W6QjX52CimKbj4ueU93F+CJi0bxKX5aAoa1NXGwVLWmaJMIT4RKQaINlhVJ/DvlhDbA==
X-Gm-Gg: AYBFou2iI95kfA0dxh3JrNQZ37uSnatEMBF8jf0wlIu3u4+qc6enkAk3KUBa3YDPBgH
	BAbT7pKkALYo2BWnBUnY6vjIns0LuV4t1/e8WSp3nlF1odEi90N03bAu35/i8UM+lPtbN6yl1ZQ
	PVTfmtBkhvqvr9zFGTEK7YOHRKyGRTulE8n3MYIKfWVtkpRTT7iWcwflY24hNJCF8G+qP+NtEtb
	takwjsNLemcvgfJTr9JluHHRu4wsf94S1HtHM1HMQ65tUGbCtmLfdpBDeCoK9i6Jy7rmsu1nyQj
	7z6eaQ5L1fFL0b/lQ3nfUmbqs/Zxhcb3ZhVWud5UQkZuPZ8n+xZJi46KbtfuMLxpU0l1Xmd7hPR
	Axep8l5HEc4mFNgzuaLfA1wr7OLIbWK4KnZ1DZONkMwKZSdxuH+WI68h+aG7Sv45tk1S1GImpUn
	4sMRZ7Wh/oqIdo
X-Received: by 2002:a05:620a:4041:b0:937:675e:2903 with SMTP id af79cd13be357-93ebd212371mr3197368585a.14.1792068255567;
        Thu, 15 Oct 2026 05:44:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:937:675e:2903 with SMTP id af79cd13be357-93ebd212371mr3197362985a.14.1792068254905;
        Thu, 15 Oct 2026 05:44:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafdf2fa18sm5761271fa.36.2026.10.15.05.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:44:13 -0700 (PDT)
Date: Thu, 15 Oct 2026 15:44:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 07/13] drm/msm/dcp: Add DCP encoder
Message-ID: <bmtabdrtxygyubfmxgvixn5r4rosu4tepopc2ro37heeqzwzgx@mu5wk2stm7yi>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-7-48aad0fe4f72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-jshekhar-drm-msm-dcp-v1-v1-7-48aad0fe4f72@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0caa0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=N3-jI2xQlndCWEcerb8A:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MCBTYWx0ZWRfX+kAd1McjPke6
 HG4iUK3l1UMbWe/UrzI+cdN7pwuBV7Imi4vLpRYysRTpQ/881jAffH6cM8b4b1iMJjcdftaGYND
 BUpUn+b/iOpdOnQ0RtrlVhDj5DUi6WblYr8kdXFflSIDH50uFnLjnC+dIXhV0mFiaagbKwp0jjH
 qQ3hRFXoizo1KWkbUMHpbtNiri8HfEI0hPiwOAqjiXQVpz13rOWJv5pDHomS0V7qM8oz9YIinZN
 cJ513jMmRmBQDbWd5KIOXDVbh3CGJ3ezyXTkYPoiOSS+JoSmB9Sloc43MAJm819ttjMv5C93ErG
 /LulJzoPHHZM6ct7bwfeYJlA5AF8R4NqP8vih07z1S+Wdo5uQZ57F1sHHMK4QwLoVFs3MIXY1MQ
 iJR12uFHkW3WPdiUEdZmSgrkTCJD8PYjiVLOkhLPVnoMSQm0Yi8GsSo37auekN2ZO6/4ZPE6V6k
 rRafg3Cwl6zs9WeUTag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MCBTYWx0ZWRfX2ved6GXy+t4Y
 9U12l/bZdRKoj6yeN9SstER6vNEO0sKYw2o/2N9/94qwgAVDmptxZGYX5CuMIVx6e+Mi9mOpBdI
 D9NmJzZQhIeRT6Dk2WhoOqsgPzfjFgw=
X-Proofpoint-GUID: xMKCt-2CAA449yG9Eu878XpMVb1amIEp
X-Proofpoint-ORIG-GUID: xMKCt-2CAA449yG9Eu878XpMVb1amIEp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150050

On Thu, Oct 15, 2026 at 01:08:27PM +0530, Jayant Shekhar wrote:
> The DCP display pipeline needs a DRM encoder to connect a CRTC to its
> firmware-backed output bridge while reusing the existing MSM DRM object
> model.
> 
> Add the DCP encoder wrapper and keep encoder allocation and DRM object
> initialization independent from bridge and KMS registration.
> 
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> Assisted-by: LLM
> ---
>  drivers/gpu/drm/msm/Makefile          |  1 +
>  drivers/gpu/drm/msm/dcp/dcp_encoder.c | 31 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dcp/dcp_encoder.h | 16 ++++++++++++++++
>  3 files changed, 48 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index b7c1a2e9a19e..e7d24be72113 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -81,6 +81,7 @@ msm-display-$(CONFIG_DRM_MSM_DCP) += \
>  	dcp/dcp_hfi_plane.o \
>  	dcp/dcp_ipcc.o \
>  	dcp/dcp_plane.o \
> +	dcp/dcp_encoder.o \
>  	dcp/hfi/hfi_packer.o \
>  	dcp/hfi/hfi_unpacker.o \
>  	dcp/hfi/hfi_utils.o
> diff --git a/drivers/gpu/drm/msm/dcp/dcp_encoder.c b/drivers/gpu/drm/msm/dcp/dcp_encoder.c
> new file mode 100644
> index 000000000000..bc173fffb325
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dcp/dcp_encoder.c
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * DCP encoder wrapper for the CRTC-to-bridge connection.
> + * Hardware programming and mode sequencing are handled by the bridge and HFI.
> + */
> +
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_managed.h>
> +
> +#include "dcp_encoder.h"
> +
> +struct drm_encoder *dcp_encoder_init(struct drm_device *dev, int enc_type)
> +{
> +	struct drm_encoder *encoder;
> +	int ret;
> +
> +	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
> +	if (!encoder)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = drmm_encoder_init(dev, encoder, NULL, enc_type, "encoder%d",
> +				dev->mode_config.num_encoder);
> +	if (ret) {
> +		dev_err(dev->dev, "encoder init failed: %d\n", ret);

Again, ignored feedback. Use drm_foo functions instead of dev_foo().
Also, there is little point in printing an error here.

> +		return ERR_PTR(ret);
> +	}
> +
> +	return encoder;
> +}
> diff --git a/drivers/gpu/drm/msm/dcp/dcp_encoder.h b/drivers/gpu/drm/msm/dcp/dcp_encoder.h
> new file mode 100644
> index 000000000000..de40c9bca4bb
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dcp/dcp_encoder.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * DCP encoder interface between the CRTC and bridge chain.
> + * Hardware programming is delegated to DCP firmware.
> + */
> +
> +#ifndef __DCP_ENCODER_H__
> +#define __DCP_ENCODER_H__
> +
> +#include <drm/drm_encoder.h>
> +
> +struct drm_encoder *dcp_encoder_init(struct drm_device *dev, int enc_type);
> +
> +#endif /* __DCP_ENCODER_H__ */
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
