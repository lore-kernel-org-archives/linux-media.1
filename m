Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025782;
	b=w9t4lN2CSD4+JL2LXU9FTt6usCFUMUuaVznAZNfDQGmlTRbgccgjSEhEqmigxhIYf1fX
	 d0zTKihE1zglS78+x4/Jtqb3L/oAe7YAPgm9dYPAVFnD/u4dzTBEAl6T5F7KCJHyaNosO
	 lKDlbqDiDINe1Uh9i9D0lODcuHILJP9dwXXcifogSZXKLk3qYt3Q/D/st8f6No+pF+6mE
	 dLr6WHa4ialfjzPP+Zg3wS0Suc1XJbErLPA6z6xrI4Gqy1WdTEHB6Ctr3qZKBumK+/+ff
	 YGRkKTjMkpJgpe5k/6RkgUasHSgonigWjjuGMILwjFP2q0puor0ZuhQ1rcmorip8MhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025782;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=09aJ8L1OVTrnJV751FfxeO3NQL3YOp8bQs333698z88=;
	b=nfmj3s4BYd+2l/YXWfPWQ/wNVoxq3y1keJIMy0TDfX2FTwFT58eZR7HJFruEOOld677y
	 eJpdAHZmLDPTXWcVDeAw45Aw545EqR3bG++m4NN4j518fdk6PU952tbziEOmoBK2amF9U
	 dBPrlm/FrSlhPKBO/P3lz5WEq00HL50il+YyR9au12IPh3soPCgwt67jCIsGA3mkl8D/k
	 8PuytmrQJ0xFqcJFCT95ZDFmRaqSK7z008hz0l7Nvq8PQ8kIHZxRrDlfaDXWVy7pOnMXX
	 k4KC4Ie//UNCb10lGxocSaF/oOhwSW2Dex7FofgDteVyaXbwWPnVaF+F8/SdMvEVqkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j41cvNl6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1JD3a9t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176F2606A331
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 14:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 176F2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j41cvNl6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1JD3a9t
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtNjS3050893
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 14:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	09aJ8L1OVTrnJV751FfxeO3NQL3YOp8bQs333698z88=; b=j41cvNl6Ev3LOIQd
	VY2aZwnEqjMO94P4Pa9oHxau/65Gs+fWNZLIUyQssZSpmfz5XFgdtwBtoaWCYxDq
	HHkDdOMD34nsYGmDD2Zg2nBMnG8Cfuh0YS+lh3FWH+Re4qrWGWvjj9tnCee8P48u
	5Bzt6xSuBoUs8VtNdNRyxQDynJ5JoXPfhPolr988NhF6TnvGhprGAIEZkhLZcbsv
	xP3M+v/g4XxahE4Eu7OdU63/M9K2Ng6jS3d9+OxJ+R4imkD/DiYwgvAFOoNBc9yo
	TOFkwxxQ2DkqETZ/IpdLXDz+amIcVheKWH8/a3zxm9I63vfhN/6qnHCbMIC/o+R7
	dg+Xgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvddamxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 14:42:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so555278785a.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 07:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793025779; x=1793630579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=09aJ8L1OVTrnJV751FfxeO3NQL3YOp8bQs333698z88=;
        b=L1JD3a9tVRxmii9q+j03ni9ZBWKYnbQcge4y6Mp45IloDa4saewkpDJ2og/nldnTby
         WylTHEEKDtJ7iALCXMyJY7qVLqJwSBXH5XGmUj5NDs/I96eqeyOQoKnZ4ot2+F/LuV9O
         R0ZkrjCUv7sUZ7TLSigcjI4r+7PAGhyZm2122rpxVtPCJCmDj4r2iBsFmMJx30fqaqUO
         w3/4/ajLCIbe/rzkHw/965jH9bBdcfhoSXCEaQSRx7ChGt9Vx2UsNP8jFHe0FHTj6FoV
         dT47z3PrSqVRGswoUv11YZc9pMCxt1I3bmXeMHjaMcJcZlKCRykvdDpMH7j3NJ51TNpZ
         P8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025779; x=1793630579;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09aJ8L1OVTrnJV751FfxeO3NQL3YOp8bQs333698z88=;
        b=WBOEHn2icamPoxWmBBKhgfi8QYPt5Y569Ne45wxxLcOS6PuH9guytYYbqO0EX/1F5I
         6OHYZr6WfcYvPB4gZBE9f2/1e4h1KukJICsAcoK5igmWmvpRLCgrm8phAYwAmTR8V6pl
         edl3vr31QVmolj1E8MlTMjgzzRPwBilloQV6uD3+vQ1l/Mj+zJgJNaKfRUsannlWAMKU
         hHTy+pIgwbsxgaO3siJ3cmP379mNu0QPFOPh8EzDALbOFsKQitYQExyBK59XLITlkDBA
         WXHRzlDkf882lAFYjlWcZ8MiuvwWwXcyiZF8+OlyBZpTIpwA5dOMpC09dzw2cHRnSBp6
         lFgQ==
X-Gm-Message-State: AFq9FYKrW/WYra5jJ0ZZ6ceqt1kpR88HPFPVzo+DP150DVk9fnJW1mZ3
	gGPme3Hl1Ue3I8wk5FeXJSZkAW+Tp1JzITr58OEr5RfZwGFF5vWmFoyYXtjVKUdwxMomXapsZR3
	CLouMZv8WPRloTvmlnOlKXQsiWXxxDPdBw2lwoPnN+ufTtiNjW675AvdPByzAbeEvbg==
X-Gm-Gg: AYBFou3yQ0ZH5ZHc/xdp7ZlKpu8U1nZndohFE+A3SOUA1A6uC3S+5s1Nm0HtUhc9Lzu
	eIQQcWRjOYkmdnOz5ZXI0rxsZdX4XUzYH2f9cPrlfGuGp43imkqny3+1QgHsHscXMbWcYHcGk6/
	RjoNmNMJ4GIbjkPNSSXs10KaGjKUm9Wq7b48USAPrmB1kttaXC6RJp9ttWiELy40Eb3NxNal0vs
	vb3tNzAssHsCRSWo4KCiaXvqPiWV4qhpvV2ZsR0VcK/4PJ5jNxZqFnDqRa91f/HEhEqP9Ec7bMB
	2Ukt/7Jf3VRmTwekIXckk7kO3hmEz9etr8RKgqKqvxqWDbNyekMXRoVHmqXNKshcHLtKgPszK7F
	2z2KswmR5FVPHmmJVToU=
X-Received: by 2002:a05:620a:3184:b0:93f:1936:b1f2 with SMTP id af79cd13be357-940ef9ca117mr973042785a.81.1793025779241;
        Mon, 26 Oct 2026 07:42:59 -0700 (PDT)
X-Received: by 2002:a05:620a:3184:b0:93f:1936:b1f2 with SMTP id af79cd13be357-940ef9ca117mr973036185a.81.1793025778673;
        Mon, 26 Oct 2026 07:42:58 -0700 (PDT)
Received: from [10.40.99.45] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd350706sm336512066b.3.2026.10.26.07.42.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:42:57 -0700 (PDT)
Message-ID: <62db6c93-a8f1-42be-bc2f-6df46c470d96@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:42:56 +0100
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
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v11 5/9] media: Documentation: uapi: Add qcom-camss ISP
 params documentation
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
 <20261023-camss-isp-ope-v11-5-0c2937195298@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20261023-camss-isp-ope-v11-5-0c2937195298@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IH7l_8lhQXXJlUVVJQNbo89FDz6RVwE_
X-Proofpoint-GUID: IH7l_8lhQXXJlUVVJQNbo89FDz6RVwE_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1OCBTYWx0ZWRfXyL62hBSdsLyM
 i7tKYlcM7iGLXAgUp3WVHLgqSHGpeyYFGOaIeRUg16fd9+OoFEe6HRwGXkRCe2+7pJUKuYL24y4
 eTrCDflS95htE3GeuRHuxynmlAFhUFfPHHrceG0Uyjyl6tFptOm848n75lpaVt1aa3Oa5wHJoIV
 m0uVWG7DDfOXir3R3YwM09fsRXudRg62chO+B5GBMImGKtrL9XCn+tyKsMJ7dDUmdsnVm9Mj8+y
 rX8cIIG7KUAFvba7QZ7zYVZ7RS9EUzz0/j8Ipar/1ntQRGl/NITTFaqcnH6CgCsOaSlHu7beqZ8
 MY5fy/RHdZB1I1jjUMIrYdBim8ewA7XgvDxao3CLU+3Qk/rwu+lTG9hM95aAEzmA7hFpZazgBDn
 LYgCM3Iqyti2EO2IzhfXaAbgf414z5RdqXfL8VG6rEugSd5ZqH/soYnT/5uDBeMccf/pZVvvusM
 4gFoWaohA8iNM+xmgRg==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf66f3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5S4UquuD0OMwzOfU3tcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1OCBTYWx0ZWRfX/HeH+KNqHLAG
 l68e896BiyzEozW9n9DdK11ND22OZiWUrhMIFbhwJmswL0EsfqEEoVJhABUJNairzuphRojp6/v
 Cq6mjnUiZd5Fj2GUDdVdS4ZDDaVfNUA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260058

On 23-Oct-26 5:09 PM, Loic Poulain wrote:
> Add documentation for the Qualcomm CAMSS ISP parameters metadata format
> (V4L2_META_FMT_QCOM_ISP_PARAMS). The format is built on the V4L2
> extensible ISP parameters system, with per-block structs defined in the
> qcom-camss-config.h uAPI header, and is designed to be shared by any
> CAMSS ISP engine exposing a parameters metadata output video node. The
> Offline Processing Engine (OPE) ope_params node is the first consumer,
> with additional engines expected to add their own parameter blocks in
> the future.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

With the remark that this is quite OPE specific atm and we will likely
need to split this into generic + ISP specific doc files later when
we also add support for e.g. inline ISPs.

It is probably best to figure out how to split the docs once we are
landing a second ISP driver upstream though, so for now this is good
as is.

Regards,

Hans




> ---
>  .../userspace-api/media/v4l/meta-formats.rst       |   1 +
>  .../userspace-api/media/v4l/metafmt-qcom-isp.rst   | 147 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  3 files changed, 149 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> index b5455229837e707c24e134438d5e2fd12cb3bf37..25b46af4d9f7faab37000076c530e9aad5b4a076 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -20,6 +20,7 @@ These formats are used for the :ref:`metadata` interface only.
>      metafmt-intel-ipu3
>      metafmt-pisp-be
>      metafmt-pisp-fe
> +    metafmt-qcom-isp
>      metafmt-rkisp1
>      metafmt-rppx1
>      metafmt-uvc
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst b/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..da0dd9b0884ea8b3c5fba7b5aa2eb1af80418cae
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
> @@ -0,0 +1,147 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. c:namespace:: V4L
> +
> +.. _v4l2-meta-fmt-qcom-isp-params:
> +
> +**************************************
> +V4L2_META_FMT_QCOM_ISP_PARAMS ('QCIP')
> +**************************************
> +
> +Configuration Parameters
> +========================
> +
> +The ``V4L2_META_FMT_QCOM_ISP_PARAMS`` format carries image processing
> +configuration for the ISP engines found in the Qualcomm Camera Subsystem
> +(CAMSS). It is passed to a metadata output video node using the
> +:c:type:`v4l2_meta_format` interface.
> +
> +Rather than a single struct containing sub-structs for each configurable area
> +of the ISP, parameters use the :ref:`v4l2-isp` parameters system, through which
> +groups of parameters are defined as distinct structs or "blocks" which may be
> +added to the data member of :c:type:`v4l2_isp_buffer`. Userspace is
> +responsible for populating the data member with the blocks that need to be
> +configured by the driver. Each block-specific struct embeds
> +:c:type:`v4l2_isp_block_header` as its first member and userspace must
> +populate the type member with a value from :c:type:`camss_params_block_type`.
> +Populated blocks must be placed consecutively in the data member, and the
> +combined size of all populated blocks must be set in the data_size member of
> +:c:type:`v4l2_isp_buffer`.
> +
> +The set of supported blocks depends on the CAMSS engine consuming the buffer.
> +The block definitions themselves are shared across CAMSS ISPs; currently the
> +Offline Processing Engine (OPE) is the only engine consuming them, through its
> +``ope_params`` metadata output video node. Additional engines and blocks may be
> +added to this format in the future.
> +
> +A block carrying ``V4L2_ISP_PARAMS_FL_BLOCK_DISABLE`` bypasses the
> +corresponding hardware module. Any other block updates the module's
> +configuration and leaves it enabled. Blocks omitted from a buffer keep their
> +previously programmed configuration and enable state; until userspace submits
> +a block for a given module, the driver's default configuration applies.
> +
> +OPE processing pipeline
> +=======================
> +
> +The OPE is a memory-to-memory engine that reads a Bayer RAW frame from its
> +``ope_input`` node and writes a YUV frame to its ``ope_disp_output`` node. The
> +parameter blocks configure fixed-function hardware modules that the frame data
> +passes through, in the following order:
> +
> +.. code-block:: none
> +
> +	 Bayer RAW in            RGB domain                      YUV domain      YUV out
> +	 (8/10-bit)   +------+   +------+   +------+   +------+   +------+   +------+   (NV12/NV16/
> +	  ----------> |  WB  |-->| DEMO |-->|  CC  |-->| GLUT |-->|CHROMA|-->| DSC  |----------->
> +	              +------+   +------+   +------+   +------+   |ENHAN |   +------+    NV24/GREY)
> +	                                                         +------+
> +
> +The stages, and the parameter block that configures each one, are:
> +
> +.. flat-table:: OPE pipeline stages
> +    :header-rows: 1
> +    :stub-columns: 0
> +
> +    * - Stage
> +      - Module
> +      - Parameter block
> +      - Function
> +    * - WB
> +      - CLC_WB
> +      - :c:type:`camss_params_wb_gain`
> +      - Per-channel white balance gains and black-level / pedestal offsets,
> +        applied to the raw Bayer data.
> +    * - DEMO
> +      - CLC_DEMO
> +      - *(none)*
> +      - Demosaic: reconstructs a full-resolution RGB image from the Bayer
> +        mosaic. Always enabled; not configurable through this format.
> +    * - CC
> +      - CLC_CC
> +      - :c:type:`camss_params_color_correct`
> +      - Color correction matrix applied in the RGB domain.
> +    * - GLUT
> +      - CLC_GLUT
> +      - :c:type:`camss_params_gamma`
> +      - Per-channel gamma correction curves (256-entry LUTs).
> +    * - CHROMA_ENHAN
> +      - CLC_CHROMA_ENHAN
> +      - :c:type:`camss_params_chroma_enhan`
> +      - RGB to YUV color transfer matrix.
> +    * - DSC
> +      - Downscaler
> +      - *(none)*
> +      - Chroma (and, when required, luma) downscaling to produce the requested
> +        YUV subsampling, e.g. YUV 4:4:4 to 4:2:2 (NV16) or 4:2:0 (NV12).
> +
> +The input node accepts 8-bit and 10-bit packed Bayer RAW formats (for example
> +``V4L2_PIX_FMT_SRGGB8`` and ``V4L2_PIX_FMT_SRGGB10P``). The output node
> +produces semi-planar YUV (``V4L2_PIX_FMT_NV12`` / ``NV21`` / ``NV16`` /
> +``NV61`` / ``NV24`` / ``NV42``) or luma-only ``V4L2_PIX_FMT_GREY``. A
> +configurable stage is bypassed while its block carries
> +``V4L2_ISP_PARAMS_FL_BLOCK_DISABLE``.
> +
> +The following example populates an OPE parameters buffer with a white balance
> +and a gamma correction block:
> +
> +.. code-block:: c
> +
> +	struct v4l2_isp_buffer *params =
> +		(struct v4l2_isp_buffer *)buffer;
> +
> +	params->version = V4L2_ISP_VERSION_V1;
> +	params->data_size = sizeof(struct camss_params_wb_gain) +
> +			    sizeof(struct camss_params_gamma);
> +
> +	__u8 *data = params->data;
> +
> +	struct camss_params_wb_gain *wb =
> +		(struct camss_params_wb_gain *)data;
> +
> +	memset(wb, 0, sizeof(*wb));
> +	wb->header.type = CAMSS_PARAMS_WB_GAIN;
> +	wb->header.flags = V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
> +	wb->header.size = sizeof(struct camss_params_wb_gain);
> +
> +	/* Unity gain on all three channels (15uQ10, 1024 = 1.0) */
> +	wb->g_gain = 1024;
> +	wb->b_gain = 1024;
> +	wb->r_gain = 1024;
> +
> +	data += sizeof(struct camss_params_wb_gain);
> +
> +	struct camss_params_gamma *gamma =
> +		(struct camss_params_gamma *)data;
> +
> +	memset(gamma, 0, sizeof(*gamma));
> +	gamma->header.type = CAMSS_PARAMS_GAMMA;
> +	gamma->header.flags = V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
> +	gamma->header.size = sizeof(struct camss_params_gamma);
> +
> +	/* Identity curve (pass-through, gamma 1.0) */
> +	for (unsigned int i = 0; i < CAMSS_GAMMA_LUT_SIZE; i++)
> +		gamma->glut[i] = gamma->blut[i] = gamma->rlut[i] = i;
> +
> +Qualcomm CAMSS ISP uAPI data types
> +==================================
> +
> +.. kernel-doc:: include/uapi/linux/qcom-camss-config.h
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f53047aa8d3c103edaab227e7a21e50f6d9fd733..8d48a704e959dcabc8ff45f71f35b832afcf4971 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22376,6 +22376,7 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/admin-guide/media/qcom_camss.rst
>  F:	Documentation/devicetree/bindings/media/qcom,*camss*
> +F:	Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
>  F:	drivers/media/platform/qcom/camss/
>  
>  QUALCOMM CLOCK DRIVERS
> 

