Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973343;
	b=r/oNS3l2AmRC29QEdtfBCaD5wlh7rsE9bBCEfHmdVoJB6PpPuQdMts5gyUO/6M72EeUc
	 G/JzhnG0PtM/8YTcugmepCUfFpTR0Gzr/lCIEymqWqUQj5GJcWLly9UWT978hcuBTz/aJ
	 6/Qu9vdQE2Gkzfj0Lb4JPI+xOKGxUjtFk+GL0laBX+d0R8Q8FhE3eEct94O8qJwZsY+5w
	 7s1e1Xk2cdnaeX1xEqumjOkTc3Hz3M3UDa62yuZA/6aLg7OEb3C/DfUUwN3o/02i1Dgsp
	 Te/ONkaaLoTBF4rYoKJ9L0ya+VtDtvlWSkcQg0HF+Q3p10VTn43YFt4MNUzKv7efheg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5XyZUDkR6hNXTjrZPWq6NTK8zRtLjTIm0cxng3P1XAQ=;
	b=0rOpuTVJ4MI8OdHjeq+YXu9CaOMsi5GWbO9YB3DIyGiEc3wdzMwLrt5MD2DLBh5L12iQ
	 mKDLJvdXfYxPd9zMPIlJz52jzK96l6e7WijIN6Tx8jpf8vs2dji59KylKXx/VL4rb5XNo
	 4/QYfi2y8ZU4ud7hYq00p9X7mFT5Q2Wu7/EnTV+JOIAxJ5kGSW19EZhLQXy85klh/QT+I
	 97h7PcUSCbRC4PNa/x+PAqWQghcjch6TDw9XKhKqbDI42Vd2wGVn3g8xkgDYmKvUXOWhx
	 +XversGB9XjAfqTAbPodw5x6Vj9izbhUBnmfbr/NfS35uaZwzV1jlR2L1FhjE7LYyvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4YvrZVa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="J/v1pdmX";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5772E606D826
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 13:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5772E606D826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4YvrZVa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J/v1pdmX
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Do7CT971046
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 13:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XyZUDkR6hNXTjrZPWq6NTK8zRtLjTIm0cxng3P1XAQ=; b=A4YvrZVa+U+AiA+s
	DacDeA7iW7QDZvr54Nfr0uH46isVmJ0iPc5dgBObemnqHJLfBEXy+wDbrBbecaJX
	j2jzaoa6eXtLs0SRVysyv5IuJcFZN38VFYe9puGWfcUeOA2U4a8gl8c2stkanxIc
	4xcEwn2TXGc6SSuuO3GO+2LJg+vBA00XJMLLLg6wyDEAF0FhC+ehKNSqrvwmoe9D
	B512ev/TfdTMO6MB9MowFR7TSgfPZT+iBnFtGU2hSch8CLEtcdMOnwb0Dv2PcDcq
	OVmg9IlHDLbl/z71v5+ctzNXtjdmtviGsJPJCw45inIHmY5CXh3yEGIv7lD4CliX
	FCYNVA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u11s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 13:55:42 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-998a2b06e4eso36841241.3
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 05:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973342; x=1794578142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5XyZUDkR6hNXTjrZPWq6NTK8zRtLjTIm0cxng3P1XAQ=;
        b=J/v1pdmX/SQGpRb7r1CIJasiLnlCx2sz+WFjmEE0YDb16ofYVHiMsqzdUKlEE7RsP8
         4NmzSE8Udg8diOd8fbDcBzBLPPGZiTTGesx07XzVUFsi2U9VGFXVt9tjlQNf9KHEBPW+
         20XrSscnQjC3V0bQ4x7Xv8hj0eCXxfQqKsgnxStgZ0ouLJlsIHYRegwW2LW32ZyEA92A
         pgAOd7Cee85aOaxKoaqBKrs17R39Hq1vfom6ew5kJK2AjC/eICWKoCGqyjsfjEnBgUlR
         GYzdkRVMCPXSRxnFeRYgliPIy8CUozRPJ3Z3RvCwvj2u0kgrehtbNrLXF1Y/+z/ig9ID
         Ud4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973342; x=1794578142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5XyZUDkR6hNXTjrZPWq6NTK8zRtLjTIm0cxng3P1XAQ=;
        b=1LoaEFXr7AkuxcJw1T2x2/vcs5ZTjb4Z5VtdMr6+qb9L4ev18HvrKUV8omnSNh8Aav
         trwVmQTy2iS9qB2yVvjRXX3cNx9NHzMNqFN2Dyo+zXltu5N8QtkCTW7qHxav88ShfbcD
         3X00ro5fpxtI7UZPVwfC0z9wr3Aa29H+wrKWupY2VoITXInDBnMq7jBXFDM2DyD3LFMM
         LomRZf6WWBcpk0/H7Go6zZha+pRJrScxEnyYX6ETOt1KUB1J7hlwwMaS/7r1X/iET0Kn
         ZzeQBzbe/K5nobN42NYEbyMKHES9vnJIqTXbuGzBp4ZSlw42sAarnPplK0evrWwnxA4q
         nY+g==
X-Gm-Message-State: APuU4Z+/CKFzN2dCueFAPnYa07t0soGhOdyWcAfP5utW349CGnWWGHxC
	zJwXYa/kuYvv9uCFNk+mPtmNwuMBnrKqX+r1CAvWjir1xPhtlDS4gHghok1sU7MwtEtkhBcuWeX
	Ud3BA1e3jhbgkGSaEnwv2tsUC6Xw3Hd/oYT3/PyTs16WEpca5o94o7rHtvx8oMvInFA==
X-Gm-Gg: AYBFou1MSZCBA+kj4OPSpt3WHBuCaSjxAG/bskOOg8mRuh1VXlehPg8BhVRzkbm4sSI
	MXLTmlBqjD9XSLEOWHVtggefptXrg+NGrbMx8wRFgz+p8pTJqbskCoOLjs6hsIB7qf+YdHBBBg3
	Pjb8mwE4JJjrsKs5+3i2P+PfKcF2WdsL8si0bXuz1HyTedE97JdZWRYhYQpRLSvgV5L0wya6zoS
	A5XhZohBd/cIfrHTXs5pqpr+4S19e6CwpE13UwCVoNhtm/SL8Ox/SrcJ0v+29K/Fs9VlivgBR0O
	7Qbbs8A9YMc9QTPBMVNzIunaiZcrt1+MAJVkyqII3YuXDdXxd15SCdpGq/yRUSRp+eYSVfv/yqA
	yn4ks6rzGo/6EN8jlEjukPRrN3CkVve3zVbEe4g/ozWFK546JmI7nei3/enFooumqkYbFPHlyVt
	g9/SRvLQzdAwrnQZWGC7526RtWdXtbT0xMkh2cMZyIsGEBCTEST80W+DnvffTzrjO+OpOkPyxdb
	BMG1IJSslVhdXblFjRlCnOrR1TE
X-Received: by 2002:a05:6102:54a4:b0:7c5:4da3:aefb with SMTP id ada2fe7eead31-7d2a16eba5dmr1219356137.34.1793973341477;
        Fri, 06 Nov 2026 05:55:41 -0800 (PST)
X-Received: by 2002:a05:6102:54a4:b0:7c5:4da3:aefb with SMTP id ada2fe7eead31-7d2a16eba5dmr1219327137.34.1793973340814;
        Fri, 06 Nov 2026 05:55:40 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:37 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:21 +0100
Subject: [PATCH v14 5/9] media: Documentation: uapi: Add qcom-camss ISP
 params documentation
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-camss-isp-ope-v14-5-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
In-Reply-To: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfXz95uYhcA4x0f
 P0m28aviFTMq8quS4DtclpRc6tzpDdRfWARKBeCZAZsfqb4w2sji/LO0G2gkfl8N4YMit8OFxrm
 bZubfXTLN1jA6ti8P+BqhTe/GnMX8pM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX5MlTk7ykaxmD
 QDnDug3eyrOE1EhS2IGWrF2P5K1ntuRl/vYXenxMBqv2nZBlKsNhO+lblU3YkvkllvfsKOiCXrB
 9gMPETtY9AwexIAug9MQXA00uB81IqkdZOBXZbAFbae5FSvFX48dHQpwVNM/e6p/rnKTNO4JGeT
 6fyPewSO1DT3/3yEsJQk5B+KuiY2dNpwj4hJ+I6YXtxlNZjBD8LVqRFi+EQ/gY64ail2B3/juNC
 GR4n9VJkbQ+cRE03al8KbFjG25KUh/QVkXUFOpxfhDUxlWH5rca1Pmz4RGlg1k62RJz3wxZTyyl
 tw4aGVHRq+pikl/iHL+1mwCjL871LrsjqucWosS0Xg0GvgU1JzOq21jWB5l8jQk/uCmPJ1Cm5R4
 btvXzr1IzuD8gQluvMWsSyIiIbIxGjZa4xzkJJIpiV5nSo8aNN9z1qdZ+OLIaXbrHHa4KF3kyQ8
 4TgEv0LFAovC8YMIZog==
X-Proofpoint-ORIG-GUID: 7OqLz9WFtrACKdJHqV1n9otSANNYV2-_
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aeddc5e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Nff7jVtaK1xTle8F27sA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: 7OqLz9WFtrACKdJHqV1n9otSANNYV2-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060055

Add documentation for the Qualcomm CAMSS ISP parameters metadata format
(V4L2_META_FMT_QCOM_ISP_PARAMS). The format is built on the V4L2
extensible ISP parameters system, with per-block structs defined in the
qcom-camss-config.h uAPI header, and is designed to be shared by any
CAMSS ISP engine exposing a parameters metadata output video node. The
Offline Processing Engine (OPE) ope_params node is the first consumer,
with additional engines expected to add their own parameter blocks in
the future.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/meta-formats.rst       |   1 +
 .../userspace-api/media/v4l/metafmt-qcom-isp.rst   | 147 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 3 files changed, 149 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index b5455229837e707c24e134438d5e2fd12cb3bf37..25b46af4d9f7faab37000076c530e9aad5b4a076 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -20,6 +20,7 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-intel-ipu3
     metafmt-pisp-be
     metafmt-pisp-fe
+    metafmt-qcom-isp
     metafmt-rkisp1
     metafmt-rppx1
     metafmt-uvc
diff --git a/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst b/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
new file mode 100644
index 0000000000000000000000000000000000000000..a218b9aedb28a532358434d35303c2cdb93345f3
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
@@ -0,0 +1,147 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. c:namespace:: V4L
+
+.. _v4l2-meta-fmt-qcom-isp-params:
+
+**************************************
+V4L2_META_FMT_QCOM_ISP_PARAMS ('QCIP')
+**************************************
+
+Configuration Parameters
+========================
+
+The ``V4L2_META_FMT_QCOM_ISP_PARAMS`` format carries image processing
+configuration for the ISP engines found in the Qualcomm Camera Subsystem
+(CAMSS). It is passed to a metadata output video node using the
+:c:type:`v4l2_meta_format` interface.
+
+Rather than a single struct containing sub-structs for each configurable area
+of the ISP, parameters use the :ref:`v4l2-isp` parameters system, through which
+groups of parameters are defined as distinct structs or "blocks" which may be
+added to the data member of :c:type:`v4l2_isp_buffer`. Userspace is
+responsible for populating the data member with the blocks that need to be
+configured by the driver. Each block-specific struct embeds
+:c:type:`v4l2_isp_block_header` as its first member and userspace must
+populate the type member with a value from :c:type:`camss_params_block_type`.
+Populated blocks must be placed consecutively in the data member, and the
+combined size of all populated blocks must be set in the data_size member of
+:c:type:`v4l2_isp_buffer`.
+
+The set of supported blocks depends on the CAMSS engine consuming the buffer.
+The block definitions themselves are shared across CAMSS ISPs; currently the
+Offline Processing Engine (OPE) is the only engine consuming them, through its
+``ope_params`` metadata output video node. Additional engines and blocks may be
+added to this format in the future.
+
+A block carrying ``V4L2_ISP_PARAMS_FL_BLOCK_DISABLE`` bypasses the
+corresponding hardware module. Any other block updates the module's
+configuration and leaves it enabled. Blocks omitted from a buffer keep their
+previously programmed configuration and enable state; until userspace submits
+a block for a given module, the driver's default configuration applies.
+
+OPE processing pipeline
+=======================
+
+The OPE is a memory-to-memory engine that reads a Bayer RAW frame from its
+``ope_input`` node and writes a YUV frame to its ``ope_disp_output`` node. The
+parameter blocks configure fixed-function hardware modules that the frame data
+passes through, in the following order:
+
+.. code-block:: none
+
+	 Bayer RAW in            RGB domain                      YUV domain      YUV out
+	 (8/10-bit)   +------+   +------+   +------+   +------+   +------+   +------+   (NV12/NV16/
+	  ----------> |  WB  |-->| DEMO |-->|  CC  |-->| GLUT |-->|CHROMA|-->| DSC  |----------->
+	              +------+   +------+   +------+   +------+   |ENHAN |   +------+    NV24/GREY)
+	                                                         +------+
+
+The stages, and the parameter block that configures each one, are:
+
+.. flat-table:: OPE pipeline stages
+    :header-rows: 1
+    :stub-columns: 0
+
+    * - Stage
+      - Module
+      - Parameter block
+      - Function
+    * - WB
+      - CLC_WB
+      - :c:type:`camss_params_wb_gain`
+      - Per-channel white balance gains and black-level / pedestal offsets,
+        applied to the raw Bayer data.
+    * - DEMO
+      - CLC_DEMO
+      - *(none)*
+      - Demosaic: reconstructs a full-resolution RGB image from the Bayer
+        mosaic. Always enabled; not configurable through this format.
+    * - CC
+      - CLC_CC
+      - :c:type:`camss_params_color_correct`
+      - Color correction matrix applied in the RGB domain.
+    * - GLUT
+      - CLC_GLUT
+      - :c:type:`camss_params_gamma`
+      - Per-channel gamma correction curves (256-entry LUTs).
+    * - CHROMA_ENHAN
+      - CLC_CHROMA_ENHAN
+      - :c:type:`camss_params_chroma_enhan`
+      - RGB to YUV color transfer matrix.
+    * - DSC
+      - Downscaler
+      - *(none)*
+      - Chroma (and, when required, luma) downscaling to produce the requested
+        YUV subsampling, e.g. YUV 4:4:4 to 4:2:2 (NV16) or 4:2:0 (NV12).
+
+The input node accepts 8-bit and 10-bit packed Bayer RAW formats (for example
+``V4L2_PIX_FMT_SRGGB8`` and ``V4L2_PIX_FMT_SRGGB10P``). The output node
+produces semi-planar YUV (``V4L2_PIX_FMT_NV12`` / ``NV21`` / ``NV16`` /
+``NV61`` / ``NV24`` / ``NV42``) or luma-only ``V4L2_PIX_FMT_GREY``. A
+configurable stage is bypassed while its block carries
+``V4L2_ISP_PARAMS_FL_BLOCK_DISABLE``.
+
+The following example populates an OPE parameters buffer with a white balance
+and a gamma correction block:
+
+.. code-block:: c
+
+	struct v4l2_isp_buffer *params =
+		(struct v4l2_isp_buffer *)buffer;
+
+	params->version = V4L2_ISP_VERSION_V1;
+	params->data_size = sizeof(struct camss_params_wb_gain) +
+			    sizeof(struct camss_params_gamma);
+
+	__u8 *data = params->data;
+
+	struct camss_params_wb_gain *wb =
+		(struct camss_params_wb_gain *)data;
+
+	memset(wb, 0, sizeof(*wb));
+	wb->header.type = CAMSS_PARAMS_WB_GAIN;
+	wb->header.flags = V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+	wb->header.size = sizeof(struct camss_params_wb_gain);
+
+	/* Unity gain on all three channels (15uQ10, 1024 = 1.0) */
+	wb->g_gain = 1024;
+	wb->b_gain = 1024;
+	wb->r_gain = 1024;
+
+	data += sizeof(struct camss_params_wb_gain);
+
+	struct camss_params_gamma *gamma =
+		(struct camss_params_gamma *)data;
+
+	memset(gamma, 0, sizeof(*gamma));
+	gamma->header.type = CAMSS_PARAMS_GAMMA;
+	gamma->header.flags = V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+	gamma->header.size = sizeof(struct camss_params_gamma);
+
+	/* Identity curve (pass-through, gamma 1.0) */
+	for (unsigned int i = 0; i < CAMSS_GAMMA_LUT_SIZE; i++)
+		gamma->glut[i] = gamma->blut[i] = gamma->rlut[i] = i;
+
+Qualcomm CAMSS ISP uAPI data types
+==================================
+
+.. kernel-doc:: include/uapi/linux/media/qcom/camss-config.h
diff --git a/MAINTAINERS b/MAINTAINERS
index e4ca41cdd8729625fe2f731cd443bdd4da527dca..234c4c69dec7e7264763f1970438c22d0cec11a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22908,6 +22908,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/qcom_camss.rst
 F:	Documentation/devicetree/bindings/media/qcom,*camss*
+F:	Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
 F:	drivers/media/platform/qcom/camss/
 
 QUALCOMM CLOCK DRIVERS

-- 
2.34.1

