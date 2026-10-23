Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768185;
	b=B8ZH140KzcPDtCdEuwM3apW4zyldZDeQbXFmoXGK2Ox7tpD6qjQZxv9ZNVwdGuLUJCGx
	 rSyIgpdw9vEqKzTgde08p++/zZX9FkjmipgawWACEbU+EHP4XmnrCSqrE56j5HWPIKW+I
	 vm8ssMiwCn2bZiHVMA2vlh41DVFa7VjaaV3TDY4StO5pwwXYMNnc1hprvUIRtMCnrimbs
	 EM7quQcx7cvX2RInloJEnBsxdoLWvC6LjUtdx78FufNENo/zPjxsKFvvL0xsr2wMcigJQ
	 i8CkJ4VP7I6MrlBHVnKEPGKerHc385kl+f2R+298zo3jfj7qAA36+7fGjwTJ1PWKPbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768185;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PrqzT7MdVkkSP2KIivdVeNQ5hX+wDdmQ4LEI6M9HuKQ=;
	b=25UqJ/aHWUx7lnJcVwzwV4Qcjtqzq5DUP+TDS1uAvbBTsVlOmtnxzbJsgpxBNcamOHLP
	 wbXszAWSuOx++MIv8XcmHVUodnXIEHXlPe2WUc2u/A9joIFjC3JoAlZ0G/o+MooSoSgdX
	 1IEqYN/4qho/JJzyeA9dxOmz8VDiCxul5Tb0E1EB56d2FGl70SQssX1FiYX3llP2Us5a0
	 GvFvsI6fSmrKCasIaMNkkgBBVtifGoZac69yOB3jhP+ZT0EE1GQN/2ndIKhkNo3ijqTD3
	 ZTSN+Ud3+iuS1fj4/6x0KaKhms51RaaNs4ogv4nu+TXnHBqvxuiwRMimJ45UVlv9uGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oEVilMLM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RN3klIfz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C5C606A33D
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19C5C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oEVilMLM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RN3klIfz
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE67XR1955066
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PrqzT7MdVkkSP2KIivdVeNQ5hX+wDdmQ4LEI6M9HuKQ=; b=oEVilMLMf1TGim8j
	RYsGEbuhQX1MKfEADb8cVV6wCacNK7/a+qcHK3dKJP2xCtS25WQtvKYyzwN0dNFX
	O6gN260cXErrrFNvghZZtsHGt6yutwunFogDx827y8gt4VfbK9RBD1dlRXJ2s5PJ
	xVDmYpgVnopm3I+eZrELzcc4LfEiWHSWtYX42Wi2A+hJgKtD6O4f7OZl7GhLhKqH
	YhKGrD/rD9hg3SlleoIZt1BYJBbkDXZ/DAALl+FtJ3Ud9pJzlfTVqAc75Ph7nljU
	dOls7k84pezVy5VfgLm/LnXi/hELsH+AAtUjy2HBaVcDFgGXqs5PrbdxYB3Tvaf6
	pNAC4Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbm99y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:44 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c0f07b4e97so841982137.0
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768183; x=1793372983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrqzT7MdVkkSP2KIivdVeNQ5hX+wDdmQ4LEI6M9HuKQ=;
        b=RN3klIfzv0fZ0+ivWSk5eHy3qZsev97yeAwqMps4BEWtdVXvyPj9WZvJOj115H7BzM
         ZgXjqmQT+KckGVL28/h4rT5m5BKdparCx+kXeWGY3vbVo0crGFyH2TrIfAXk0r/gGRqt
         gjS898+3MXLnPFKTqwyvJIXE8b5mJg98SIe22ECzk9fub6ULkVDDKgBUSkuGE81gdzmY
         W56tLAFSfjwHbe1gO7E+RZmj9pMWpjGU9VfFX/4ufzrY3LmokR/jwe75ghH3XCjv3mW1
         +PqNu7Bt+1o/SBPD6noJJB9lzgWSotCS4DDcylqot2KM4DfGbRJ+dnDhQ26GzC6GVedC
         xsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768183; x=1793372983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PrqzT7MdVkkSP2KIivdVeNQ5hX+wDdmQ4LEI6M9HuKQ=;
        b=190F4Tzn2SeLklXLMLRP+uYktk4rL94d0F0mtUTKWOl430lKLQ6rCckdtyIwVuDpUe
         oXvUStKwqyl1MTcNa5c6bCuKqxl9qcvetaicTOxPRuY0Vu5Qq2hWMop9Zi6Q6Y9AdxSQ
         UjVjIB2wpYEgX6fIENHaBnw0t7sgapXbFJkogRZuT1HhZa+HCIf/IuGsYJSJHASnDPfg
         oiwfkUg0xItKH+jrIbky6bvD9vzvrStsh9eggpQFvqG8B2zWs9HL7uAraNRHQpuR3yQ9
         oCE09uYYAr/AaXEjRomckeaqjShIiEUsDVNoNVGsc/WMemz5Y0KLF3X6wy+l+cTnfGTH
         +naQ==
X-Gm-Message-State: AFq9FYLHoxu9nGqIwk/BsmR8zI3v6zmxBU4aWqJ9ZOs+bv886l8ltkXh
	iiavMyWufG/mtIY7aa5JhRjRLbIcteRclcTQN2O237cGVE6X5s+R/FhpwFUDFUHWcvwjDGRf5J7
	FLemjJkFxefCSZsMt8bXq6MC5M+1magchvMODoT3Dpc/yXShhZc9wx8I3p+Qs8XNb0w==
X-Gm-Gg: AYBFou18KWaxINwvwL/EVFuElkjkRN9rus8oW+E2z0LgclK8vUSzWEWmcqC11eoJ4zX
	TeDhbVw1+1YcWeuw7swrJEl0XMYjEz95horq6kA/1ibXQKL9K/vVbOXxbag+wp1ESnPFMhpmb6U
	Vwqtx0Mfh+S29LhIDoyX4sIRGRhFmdPNbnnCgtVqc+jjo5VX7uDm0gQgrB8hv9mK5MbdbjVgY9o
	30i09NWW4ZAtTh+DtRx5zHvKUhEEwtJf2q84e0jCop1sRQ5VQfF1fopZD6nJ8EMWpBHImt9ns9x
	4uB1y5onqk7/E46eEI2A1JEgN7OOKxdyAjH8e2UVrIgyQlvpDGCQnk5QC5368U/g+J/dGO8Q3b3
	g733EbW4CKbC6zmkIledjaWHYEOaMFuNsl1VD3u/9zxiCjZ6zThu4lxEe1M+qV/+I4km7j2Ja6s
	b+hZKzhp3upU+VcmQT3Xx/6IXjVrQ+tvTToGSxxPxyzSFsrKUWcBc=
X-Received: by 2002:a05:6102:418c:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7ccc3414e18mr1076036137.36.1792768183240;
        Fri, 23 Oct 2026 08:09:43 -0700 (PDT)
X-Received: by 2002:a05:6102:418c:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7ccc3414e18mr1076020137.36.1792768182758;
        Fri, 23 Oct 2026 08:09:42 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:41 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:16 +0200
Subject: [PATCH v11 5/9] media: Documentation: uapi: Add qcom-camss ISP
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
Message-Id: <20261023-camss-isp-ope-v11-5-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
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
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX6jBSY7Z67xBX
 uV9zcDo7wsr27tZwaRNSHLV9MFIlsfv4en1YMRZXOeR5l/ZtCadRWG+/SigycJ8hKVeXZtEfdqi
 TBAWNjDUkibKVVe2DRqwepPDbHejDHw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX0Lq0kiJ1kgGg
 dsfBxagyod7zF8GX3av0z8qnOWWmMW9fnlIXNr95NIv0YaZIBKiruezwr7l9zNqLU8eKnvgOMJc
 Y1HrbHsf9tgUOFE1HLzUD8WPnGL/iC+DdCATJTasS8JmG/i2uDjkFqCoh9XC5wVz2vF+Gp5KFAq
 /KAXTQSG/cNFWFMrhaxDYsUs9eMYYX9Tz728TF3/FO4JswjM/DsANIFnU9U9NvRAlxxwF6zm/zt
 Gpr31xlXD9SUfA7uOyP+4dO21qBKcF54zd29xJqJbqH5ePSJYWtu80UYrCzSMwMKCr1T/VTDtlF
 F2jXgWGzXtRBU57Ui07AMK2R9oHddtOL+Lljt0d1JG0WpIKbZrmAamvs5K5apeZWymyFSPDwCFP
 lTb0ZdJKjhWRB5WZ03IQzWefgJMifk5+r8in4AoVMY48rMlX5sfaDeZkZ9Tic3bK0XdRHDfX7D5
 kSgyfTPYCgBv9xkF51g==
X-Proofpoint-ORIG-GUID: 9DXzgvfGh6RCFd_QEX-TbEL_PkKp8oBP
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb78b8 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Nff7jVtaK1xTle8F27sA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 9DXzgvfGh6RCFd_QEX-TbEL_PkKp8oBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230059

Add documentation for the Qualcomm CAMSS ISP parameters metadata format
(V4L2_META_FMT_QCOM_ISP_PARAMS). The format is built on the V4L2
extensible ISP parameters system, with per-block structs defined in the
qcom-camss-config.h uAPI header, and is designed to be shared by any
CAMSS ISP engine exposing a parameters metadata output video node. The
Offline Processing Engine (OPE) ope_params node is the first consumer,
with additional engines expected to add their own parameter blocks in
the future.

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
index 0000000000000000000000000000000000000000..da0dd9b0884ea8b3c5fba7b5aa2eb1af80418cae
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
+.. kernel-doc:: include/uapi/linux/qcom-camss-config.h
diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c103edaab227e7a21e50f6d9fd733..8d48a704e959dcabc8ff45f71f35b832afcf4971 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22376,6 +22376,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/qcom_camss.rst
 F:	Documentation/devicetree/bindings/media/qcom,*camss*
+F:	Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
 F:	drivers/media/platform/qcom/camss/
 
 QUALCOMM CLOCK DRIVERS

-- 
2.34.1

