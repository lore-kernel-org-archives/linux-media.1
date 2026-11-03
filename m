Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793689925;
	b=bL+Vmf3RTIg9j9dVGxLbnFUIN3dnlorvdff9WYY2UPIsKhmfXBRpca2feAYwimG3j5dB
	 klVLQPF4VBgzAyJjhvKBagJOCMCwkw4Bpi97GZ21gvbum9zOpUl34vqf+sSN6UBIGtZ2+
	 I6UocA9iKZo2rIDEK9o/01GxJVhS/k77iJAi/Ghcs6nMYJwek/KGrkzCWW7TjSJYK9MXI
	 EFvbYX3ise+h6ruD8UghfSTWKe5rpadt780T0XI+OEJeP3X/W+JkkOS8drJcEpsmSOgni
	 /IFvPgNrvqZbBEylA5D+ZP5m5fmX86HklK+A42XWgmgnNeN/1zcdzA56YlUUA2r8fvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689925;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9bVxGrizvHlWGyxEpUOac+ynB7o3GHBfw8lkl6I6YiI=;
	b=xztzCUjzNnMt9XIrGDcxipq3QWu3JrgJSkH32ji+MVn4z50RN8WxOuOq/ofU8ehWPAbL
	 a5Hb45rfRfN3qBM5PJeHm5O4GD1KkDl5G74qFtraT3xIxGTIWLNQtJFUY6s3dXHhFErEU
	 MsU22/k7jiKm9KATD42muXecjQRz5vnLuLYgIQM3qTX/FxsHNsq4LOHdMm58D1HBr3WKU
	 XxyANwlpFE1aKZNGeIsKiwchNWLntrfHWrRbkS3cSOR0oWCJ38trqqvKCF0I4ooYb2jDA
	 V2Xm4kN8ayTCn3fGz6yWGVYEs9TpXs9L0gClrfO1YOGxHBP5pPwuySHq1vbwq7WuiQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=INxS16Gi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CmrogpI4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E79E606A334
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E79E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=INxS16Gi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CmrogpI4
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A34hB2I750969
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 07:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9bVxGrizvHlWGyxEpUOac+ynB7o3GHBfw8lkl6I6YiI=; b=INxS16GihLdD4J9o
	bT7Yu94iDwUURcwfD+2AVZ1tXp6IEprcYRoDsSXVKEE4go1YO+Uiy8Z0BndMZ7Rw
	qYq6zfg4pq9y8PTy+pJsbyD4QSBqHOPpWbpn05EWaJ4WEIqX2KjG1HZ3+6EnV5cP
	/ZJZQeYQyIE61k1RovTU4qiF6aqrTZAwX9BNpHj+WSio1NmYXF6u5D7+xQE35DdQ
	Z2WGcIl/BDK5P7eWWKYgbsO6B5FGfINE7lSlxmobMyRacnkO0Xz1cGEuMjBw62qe
	BVt2FvHk2aIjP1ZDws5p76wqdl4Wb0JFCO+wkZ/hvvAdPIKtn69VoAr0HKi5PnYK
	sVFTAg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5ggx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 07:12:04 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf5c02f7a3so752357137.2
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 23:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793689923; x=1794294723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9bVxGrizvHlWGyxEpUOac+ynB7o3GHBfw8lkl6I6YiI=;
        b=CmrogpI4cg7+e3BOufpA/uFcX4RtcGQhkYZzuN4SPOE0iKme/AFcRZ1Hselbyo4fJz
         0nlcnyex2OPVJPF1yeExdzqkhphvclayuFx+eCxQqAlGrpjvsZG9XyvsbNnQ0temrPsP
         SChdfOBwxxbPkxEOcYPoD5W+H3lhVZSLf1Ff5Kj2e90z+xUlSkSnd/2urHpNmULE0EX2
         M10COca5ecLphShFzE+S/Hs7NeLay9kCDyi97l4e1UQ1eOHj45Kx3nViQPsXZ6dlrEqh
         j9U9XVK4Soai491Q/XM5jIP6If0aISDUgz93bSfnPwVQ5aw2QPzWfWcjrfxU5WVHQCTA
         ru7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793689923; x=1794294723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9bVxGrizvHlWGyxEpUOac+ynB7o3GHBfw8lkl6I6YiI=;
        b=NXUHmCvF+7i2O2jmvv4pOaEUJzrqU6jPB5rn1n22L557g7EsdB142vOg1oencehTDJ
         OHpVhmBIk407NIc2zsXJGylhwGTGm3kpHhr/9R0PAai8DyWXsEKtyy5Ii1o/x3U07CSR
         hnDDBSMcmkmMknINakIN+g9oHHkGiUDzouP4xrPtxFyX4p18kdzsg3JfiVZq2/BgRgI/
         dIbm3LSOSr7VfTcevG5+Wbqj7T8Vjduk8eZcS+leHlwghWbRi5cWer1AlEME9542FHkJ
         KjqCHqodbS6/PRvqZHMgOfksZ8H4uvLohbAFVt50kONx4K+jsFr1u8cxSUi5IFkuyYPm
         OgLQ==
X-Gm-Message-State: APuU4Z8Egbv9ToPGJTvzqntMS83/wwKsc+6Lja5QPpgLuQdOpLZI8AjS
	qcq/41ba6l5qXHwzI+7drRupSq8JG/qEv3s6z/bZJGR50muRKPKY6kZ3V8R5hHHK/QO/UE63eD8
	LC7RyZgs39Cd45SvrhDx/Md3sPC80lgU7WT7+iHwP09DJNvJkrMWPJ8Mqigs6KIiD0g==
X-Gm-Gg: AYBFou3riPeFQvadRT9TgqAAON9G7B5J+WvlsW7IGzS9ht/QY9gN9OZXrsLNFQpDoFf
	pWenWbFe/e6+XEDRPy9Wir9B6UpLSRN3hNCAlfEPOkBJ3+XVyJ5k+nI/xrLAvCLNCmkihEIn8Ky
	U7yM2sx2ibq8PTRzV+k6dGd86L9p6Ug849+xBI1AxJWmx5W9cM1bJTvlzvI9rvq9CTlXnmFv3QO
	RMvaXVlQHEMA4pHcunlcsL7PVWj8lykU1wB3JrLaZyPmezFCQvo4+AoaXMrf9PAiOVOM45/1Y9g
	Gk8OAXOKBfNINTHDqCYFyCOx9sASe+DE5/RrVwuZsZplfV4u48uRDJbUIavghO2CEeEX4GBs2wX
	8w11qNLcxRBoOM5p+Pn8AeLUQ48eaqTbqvom7ng9X2Ouc2N63wt9jB/SYjoBBVGHsUkNYOWthbW
	M4+5XP8fFWX5Yl
X-Received: by 2002:a05:6102:6058:b0:7cc:95ed:30c9 with SMTP id ada2fe7eead31-7d0726402e2mr3286582137.29.1793689923241;
        Mon, 02 Nov 2026 23:12:03 -0800 (PST)
X-Received: by 2002:a05:6102:6058:b0:7cc:95ed:30c9 with SMTP id ada2fe7eead31-7d0726402e2mr3286556137.29.1793689917887;
        Mon, 02 Nov 2026 23:11:57 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8011csm26289556f8f.31.2026.11.02.23.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:11:56 -0800 (PST)
Message-ID: <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 09:11:55 +0200
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
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence
 tracking
To: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xFEz_F76gcYfJKsZOP22JxCDYI_vFLT4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyOCBTYWx0ZWRfX9ev/+ui41g7o
 WEYAgxW0Hqtn2ghKEuD45i1AlBAm4RgWL3s8GxTpfJ6EptEE3N6TV3nZDWNXVXSPNAtkSZSks3D
 9nPd4pI2zR1JwBYDgHNd0PNVwmOxIbk=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae98944 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=Mm-NeIu6uG9qZOItl_EA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xFEz_F76gcYfJKsZOP22JxCDYI_vFLT4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyOCBTYWx0ZWRfX6uqWutWHaZG4
 Dk4Rh3u2ksReqPTYtjz0y1eToum3/FnK2rS4Yaw34zspX4Egz+4PdDXILit6WCNjThTo3bBczS6
 tk3MATmV1b6LoX3jLH/2d9i7Ey6seIw7wt3+zxgx4v9MupSUNZOob11XiwQGDtNdOYOp4Osb1Dq
 YTCkcUYQan5Rfs0FpI6KKjvRH35OIDyZioprtOoENy/E+Oy8O2MCAHSV0DQpfMHmKLkY6GK7T0t
 d8ZxpCJfDMSXZBkEeG1PPiXg4DsLnmPBhh4XLwYqNG9/gA+YdfHzP8t1MbFX5srw2WtjnskfLdM
 W3WSAp9I15rZIoixO7pzPzs9/rD/tgd/L2q/Syp/q+l1bFec6I/hfRpB8ujKztwO5TFTtrXru+A
 eaS6AavLB8001AXxiELOBPIR9TjdW1fCqjHNMwOkAMYnXLAulBEGc8qFj58N0ZAlfDcKBOF3EIr
 HbzliDLyUhpoTXWa2Wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030028

Hi Bryan,

On 11/2/2026 3:56 PM, bryan.odonoghue@linaro.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> In order to communicate to user-space CSI2 SOF events we will need to hook
> into and control v4l2_ctrl_subdev_subscribe_event. In-line with other
> implementations of FRAME_SYNC have CSI decoders which support the event
> always generate it in our case if and only if an atomic user count
> indicates it should be so.
> 
> A flag in the CSID descriptor indicates if frame_sync_en is supported so
> for each SoC that supports it this flag should be true. Since bool is false
> by default no negative enumeration of existing or in-flight CSID is
> required.
> 
> Subsequent patches will enable on a per-CSID basis.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c | 54 +++++++++++++++++++++++++-
>  drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
>  2 files changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index a00791b00feb7..e9b399fcb9c7a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>  static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct csid_device *csid = v4l2_get_subdevdata(sd);
> +	unsigned int i;
>  	int ret;
>  
>  	if (enable) {
> @@ -778,6 +779,9 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>  	}
>  
>  	if (csid->phy.need_vc_update) {
> +		for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +			atomic_set(&csid->sof_seq[i], -1);
> +
>  		csid->res->hw_ops->configure_stream(csid, enable);
>  		csid->phy.need_vc_update = false;
>  	}
> @@ -1316,9 +1320,57 @@ static int csid_link_setup(struct media_entity *entity,
>  	return 0;
>  }
>  
> +static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, unsigned int elems)
> +{
> +	struct csid_device *csid = v4l2_get_subdevdata(vdev_to_v4l2_subdev(sev->fh->vdev));
> +
> +	atomic_inc(&csid->frame_sync_users[sev->id]);
> +
> +	return 0;
> +}
> +
> +static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
> +{
> +	struct csid_device *csid = v4l2_get_subdevdata(vdev_to_v4l2_subdev(sev->fh->vdev));
> +
> +	atomic_dec(&csid->frame_sync_users[sev->id]);
> +}
> +
> +static const struct v4l2_subscribed_event_ops csid_frame_sync_ops = {
> +	.add = csid_frame_sync_add,
> +	.del = csid_frame_sync_del,
> +};
> +
> +static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
> +				struct v4l2_event_subscription *sub)
> +{
> +	struct csid_device *csid = v4l2_get_subdevdata(sd);
> +
> +	if (sub->type != V4L2_EVENT_FRAME_SYNC)
> +		return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
> +
> +	if (sub->id >= MSM_CSID_MAX_SRC_STREAMS || !csid->res->frame_sync_en)
> +		return -EINVAL;
> +
> +	return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
> +}
> +
> +void csid_sof_event(struct csid_device *csid, unsigned int id)
> +{
> +	struct v4l2_event event = {
> +		.type = V4L2_EVENT_FRAME_SYNC,
> +		.id = id,
> +		.u.frame_sync.frame_sequence =
> +			atomic_inc_return(&csid->sof_seq[id]),
> +	};

On first look this was looking strange because the id is used for the
control id events not for frame sync. But on second thought it may make 
sense, but the question is how the userspace should interpret those ids?
As of today userspace does not have any info for the VC and csid internal
pipelines (so called lines). So with the current state of the code
the id is VC which makes sense becouse the SOF/EOF packets are recieved
based on VC. So i am thinking of two options:

1. Move SOF event in vfe (rdi/pix sub-devs) we have per line sub-device
   and will be well known to userspace for which line is reported.

2. Add and propose extension of videodev2 documentation that
   id of frame_sync event types represents SOF per virtual channel.

Personally i votoe for (1) because it will well fit with stream-api 
support and usespace will have clear understanding of the SOF to which
stream belongs.

Given this in mind it will be good to open discussion with Laurent, Sakari
regarding SOF event with stream api and GMSL cameras.

Regards,
~Gjorgji
 

