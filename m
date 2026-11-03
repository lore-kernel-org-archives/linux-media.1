Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693400;
	b=wISa2h55ZtctWHbkBp9759M48i5WFdixs+9ijNgOxUiWdhy3EMdN2iRcnZH1k32jeR5f
	 TnZ55t2sd+DQC0wz4jt4WZuhj6zqhORwj3BMWYRz+KKfJN71eFdACUrR2qMUxDKpLlK2B
	 azFs4W4Kd0pSzxa6EVna3m3aL4FFn1l5xKFXFUV1lqq2pV1mbZgq6M1fKVM7LnwM30oDu
	 zfTy87uU73WfqzWaAbeusBBcUiPBuUygXTKk97Swfv2TDtMW7DtHQzfPLzNQ+YvT4JvQR
	 Eb39w/mga9ajTtE7rAKDYi+CsXKXrIsplPZqVj2MOWixmj4FKxVJm9ofr8JUUb1spOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693400;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=odAVPr4oB61PcSl1pou9FnZOPHlwMEJDC6odo0jXzVk=;
	b=dvHo36RibF3sqLi1+gltuKwBIfnnEbN7d2PsEb7VpyMlUEZmcPz32ijcNLq9zZLac8eF
	 RHCyqeH4L65eNrJNHUVhL+8B6h0bjunx7wof0JhL3WYP8A6+c0+Lx5CtzjphQeG6MFFIw
	 pPOh6FpcAj6sX+4rIHRsa2U0L1EgpUU+FZ/9Oloe+sK7SpklVsMjWuIEdR37pU1qOtHyf
	 D2sQn44UWoLaJuklu5pepkWa6vDt1NUcobn4nv2fLjAVOSa4OABE7UdhWg/Q3jGSngCmf
	 Uf8XoJp2y1HWL4tfi9/VDJ/amXwT3nBWPC59y52HJXLZqMPoxbmEdrhlSaEczJx5wqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RKxmNm5D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eaNU2SII;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42CD606EE83
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 08:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B42CD606EE83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RKxmNm5D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eaNU2SII
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A32BtsI2106680
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 08:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	odAVPr4oB61PcSl1pou9FnZOPHlwMEJDC6odo0jXzVk=; b=RKxmNm5DxoxoiGgT
	B3sbHr2wgzNR+8A41QXJGvh6YVGXLlmdXeTKcmoPev4Y3tnsICOkZJCO7slNxxF3
	JGrRG4DIt2DEYS8UVlVYDSiIFua7z/h0x2UUOx0h1xfrrc+NPVsFRS8W6v1+0IlR
	lqKXuDxIt2RNL2y2wXVUrfcLa4eqQ+GUPJzomtp6gTtKdBKnAMcaW6prXij698An
	uDuhHYYY3MooCRv8rS+hveYAE1mC8MlPFrN+VQnQAf27WkhU6kYOGb8sKvwY+k44
	/8Q7yGIJenTqzwwtGETnW7nNc9dsZq7YkXCAzyeS0metK73TtIU4z8i+6XyXtYoU
	nA/Zhg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m996k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 08:09:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so94326285a.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 00:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793693398; x=1794298198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=odAVPr4oB61PcSl1pou9FnZOPHlwMEJDC6odo0jXzVk=;
        b=eaNU2SIIPi5Irzp+reC0VjAegjXrODPudxL3HmAzr+zBer1LwYTDFYBu1AHx2SlpPw
         tmZbx1ABzjpfYGQJifjd3trstckm2MBHSAO5FfAdN7iT/h9W/5GYHnTb4tv6nVIUkOJe
         lhgIpT6ed2RRSxkSX47e1zPl99Yf+OlkC/uTETVx9wdc/99sapDwB4X8QIEwHpUGMQzV
         JBe94H1hN3+PzrrJvpIzTksLJx2kN11WywnusJzv8XmVxAqnsn7FBNjPOSwowAsEwBCs
         kBGq5Fk2bMhn4jH183VIIRquxsRKxv3QHablQJxXKCVYdoIgQYv5wh3CIe7jUZhlYcH8
         pOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693398; x=1794298198;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=odAVPr4oB61PcSl1pou9FnZOPHlwMEJDC6odo0jXzVk=;
        b=wZiaeoZ9rsnH2Q5ujKSO6IsfTH94vOwJBaNU8enPT9hfLKAAb3VSLB9tdIa51lIWY1
         fccd1cR50TydMkCAf10ekBxKk+ZAWFQ5/dWdD4ywx3H3/gm2X144WAgtFaB5OOrolyZq
         4P9Ja+pLqRemaO8/JdQV3hoPGMG0ohwQYHiaVRg3WEW23Jsyo7nflJ4RRRkBe/GqZOvq
         qTVEESYHJ9ThdHmkGk52wU5aJ6W9/gKbs4LckOea0A+mAoCGALL2WvlflpJ0jUtTDN6t
         VxzFMGDi58+thAAbDd6PwozhW2T20v2vZ1SLNjCNvsQGo6vbMmjX8EN9bik7WKu30VRi
         ++hw==
X-Gm-Message-State: APuU4Z/lAdGfqAFU5bTgr2f1cXSccIE+BLfi5mvWlP1bOK+F0dbfnbm6
	fUBxnIkPlmJ0z78hdGh57sgPfpwOsIESjx039LjOUDssGB7TVC/7BOgGbV5dFM30hHHzNtJsjwZ
	rZbvRCxrIyV2Pmed+bshxouJwkS8DldGVODxoWNtCbrPMoP9yikpdBu6aLplT/yVODA==
X-Gm-Gg: AYBFou1Yyd1uDyYsj1R15/PpJfklR36uN/BuxSBd3nyiaErR7p0zeV0RFmf2oir1HsQ
	LD18XbQYU4hTlJ+xsINSzaO2EuMO6hyAhGrcKh7bksCxUijufwwwO1Nel9/EGcwVMXmTVgnwRRa
	h4pLZ2JqjN/SxRU/xE2P/abnujI0eruegv3rz7PzAvEWjrs01trIsPB1ZakaMS2YmhubXWgGyY8
	qKsebO3IM6IB84DBhCyFfS+iw13hHRvJLF2Z5yrRHcasIxzfJI5B/cM27KxzWvm4sW9omepfXVa
	posYQbdLuHJ4bVdm+8sEHacWPc6UT7qVIDQqZY2qxl6X2au8jUAMMl1ueb+V1pAPtcdOLC6KPkB
	EdYSEgJ0UX+BSbn72nEakFzCf/JcRHZU2JQJHCfDvS0u9MGDz1zVQovl/iYMzBYesnXCkqpZYHD
	xSHbc9J0tegsqq
X-Received: by 2002:a05:620a:4405:b0:93f:31f0:6a77 with SMTP id af79cd13be357-94413358cf9mr2305348085a.11.1793693397716;
        Tue, 03 Nov 2026 00:09:57 -0800 (PST)
X-Received: by 2002:a05:620a:4405:b0:93f:31f0:6a77 with SMTP id af79cd13be357-94413358cf9mr2305346385a.11.1793693397285;
        Tue, 03 Nov 2026 00:09:57 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0a66caefsm259580725e9.5.2026.11.03.00.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 00:09:56 -0800 (PST)
Message-ID: <25952c4c-36db-4361-9ab6-0ca1b1f960bf@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:09:54 +0200
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] media: v4l2-device: Add struct v4l2_device.flags
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski
 <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
 <20261103-rkisp1-suspend-and-resume-v1-2-08f863b6fdc5@ideasonboard.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261103-rkisp1-suspend-and-resume-v1-2-08f863b6fdc5@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: okULEouzipw4my-6fYSqxsaiHDfk9dqk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzMiBTYWx0ZWRfX/E57CXyJI+b5
 36XRBNULt1WDXgpc2lok+83w25g/aC3D/u6ZMpFboKfvfOHq2NmaAjTnHuxHz/9wvkp/G7o1+21
 rFFbuAiu9efyWc1mm6oyXcX/TLAkjAM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzMiBTYWx0ZWRfX7YXos7G3iAIy
 eRBWpfAsfsqsJIMfSm/1GHDlqreyU56o4VGfOTjsTj4AHSLdUzNn3F2BXCQJ7oULjU6OIC8neNn
 6ticIWWRacLD2qsYCwif6OuBl4A3zUN3m2S/yM3cLz2xji68A9FCFP1Q9yQNnRqCUOLAXjgLM5d
 TIVfsrrdu0YUtA6DeUc6EFGYBOWJGhpW+U/CoBejyN2BmzZZ6dOnMWBkP9CSr8TDeuvJMUhHA0T
 8NzQ5Ht0Lf+EXzmUSG5J/+68JHQaZiGIGdb9ART0naoRUjLBOz5hOt+0kqTUVWUyyz9tog8mKSL
 p8yx73OJu3edwDwIOIzSR97OOcg6hX2790hxjpTvbO6m104qJuHn/F+ZUHG28axaeq2q7KLVzuq
 Gx2o6j5lyqAUoNoI98lGcWYDgdj44EX2QMmlIyYAG5R64NWrjZUx8NAf1tZvpv1jmfQT+dCfp4t
 JRMue40ZRNcYVlIhnMQ==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae996d6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=P1BnusSwAAAA:8 a=ZPX-x_UpDkASuRsfLV0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: okULEouzipw4my-6fYSqxsaiHDfk9dqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030032

Hi Daniel,

On 11/3/2026 9:40 AM, Daniel Scally wrote:
> Add a flags field to struct v4l2_device, along with a single flag
> value that is designed to tell v4l2-async in which direction data
> flows for this v4l2 device so that it knows how to set up device
> links between subdevices connected using the async APIs.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  include/media/v4l2-device.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
> index 25f69b1b8db03d077f7570471d5c6910fcafe110..9b17916d63641ba637cf8c37aa925749bd4e2134 100644
> --- a/include/media/v4l2-device.h
> +++ b/include/media/v4l2-device.h
> @@ -15,6 +15,9 @@
>  
>  struct v4l2_ctrl_handler;
>  
> +/* Set this flag if this V4L2 device is an "output" rather than an "input". */
> +#define V4L2_DEVICE_FL_IS_OUTPUT			BIT(0)

Just for the clarification do we change the meaning of output->capture to input->output?
I know that output is confusing for everyone including me but somehow i get used to it.
However to clarify what this means will be helpful :-)

~Gjorgji

> +
>  /**
>   * struct v4l2_device - main struct to for V4L2 device drivers
>   *
> @@ -30,6 +33,9 @@ struct v4l2_ctrl_handler;
>   * @ref: Keep track of the references to this struct.
>   * @release: Release function that is called when the ref count
>   *	goes to 0.
> + * @flags: device flags. Can be:
> + *   %V4L2_DEVICE_FL_IS_OUTPUT - Set this flag if this V4L2 device is an
> + *   "output" rather than an "input"
>   *
>   * Each instance of a V4L2 device should create the v4l2_device struct,
>   * either stand-alone or embedded in a larger struct.
> @@ -54,6 +60,7 @@ struct v4l2_device {
>  	struct v4l2_prio_state prio;
>  	struct kref ref;
>  	void (*release)(struct v4l2_device *v4l2_dev);
> +	u32 flags;
>  };
>  
>  /**
> 

