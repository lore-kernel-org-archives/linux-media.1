Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577107;
	b=OqQzgnkUtnYuFZ3IO/KRhg3OBCgEM1Vy9iz4+R368XrPpMPJg284NU6cVuxCzdYsI+Fs
	 sr8Gi7YkmE9/Are/YEcOe8ftG6LQHwiVGBoX7P30PAX702eIPaMudwCDSnNDVqgG5wSP6
	 +wDpZCB09y9p/2dCFmQDrGeEvDMpzTCcnXJbWWwWVEKFPeI56n9AgDwpOu6qADE9WlVay
	 QmqmEscV78xUavBGI505ZSeA6cmdDI/8sWJ0HpQ+VHcnfk89TRTA177CMZoY2BBg62DIh
	 vVOfSE716IXu9w8L3sMfqTiJaMHGNpqA0u2DAgN1Xpdi3QHJgjKRCg2nRVQZZ9iZx6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577107;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qDfRfDw6DCEw9cU7eDAJn3dXH6hhXfWNmdSaNn6QIt4=;
	b=1Pma0FJAa9SkDZY7iWk01GEx9KwVLCIdrYPruX62WWv8WVZk8D1broF6dZqUEH8YzS1R
	 P4RPw5OHEuUoKVADVpH7NaihVe6SZqZ0E9KFC6LdB9SypyfvflzlrN0jIZSHJtmcMSrii
	 XjQWxGi2ateqfteGyiWq9bG/Lc2rXY1WMsgMVJWD+zePd7u2mFjwrMrz4qGdtjHkSYy+6
	 3fQ61b+Olc9lqOQ27L3NrWsn7rNcDGMFnog/29wh/V0mzJB77O71pUs4AuAuofViBLWwe
	 wb38qtbSPq9r0yDVVuLRagdc7VLOthSVgP+8/lAv+F3OWVJKq9lVIBjiC2WVdwHILWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AIYMkSFS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Iz1TJV4/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9AB606A321
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC9AB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AIYMkSFS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iz1TJV4/
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2Arte3973987
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qDfRfDw6DCEw9cU7eDAJn3dXH6hhXfWNmdSaNn6QIt4=; b=AIYMkSFSQn7KHp3q
	O9ED9ivpZtzLwIA42XvBMRJr/2l4bArV+u2uf7astz0W7tzwm5VplxSItJqdrNvF
	VyriE48Jqkqu7ywEMEfPu9t9o7Cokt+/YpSG76Zx5yl9BwjsTWDbD83jl2WckpsI
	oKvCch2Xr9bJwONBs5ZpNMARSA797FsB833Ikc5KlSDVub1PJFDvP+cHMFV6aDw7
	AckuCHjqXcpHMg6lttgCw6+ZJ2UsNQzhC6N29kSsdgdwiUzddyxbx/Psp7AGKIxW
	rGfXnueTzzKPdP3fsLYQ//0mwRlQMo3NPSRciKSXrsESbMGl2Dy9L5CKOvPg1nbG
	l35MIw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rrgj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:25:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a079256596so3756544b3a.0
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 19:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795577105; x=1796181905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qDfRfDw6DCEw9cU7eDAJn3dXH6hhXfWNmdSaNn6QIt4=;
        b=Iz1TJV4/mm/JgyRUfhrqa0YGsas4oc4RhqQC+dHI3Rn+ms8i/v+8ZptdT12tkprhPy
         ShMPOojbtsAQ+maXtATCQ9fo5svylhtCsD2KqPpkBRovLsv2p4SU4VTE1UHDi7K++Mk2
         uPpp7tWdmD+kkH3S0n6snE7Y6A5upyj15pYjdhGJhgBpSNqQDLqMiUk+FFDOEL1Vbajg
         nVl3j7fpMyMAl7D8wxMsHe8n7f8cKTLQmdEApwQucZ0pELHVVZbMe61LuACYPcbI85mz
         fmY0fgbqy3HX6o3+JK45ip3DLBcf3xT3OjNxVCcCY2qvzN5/wCH4UKGlQEVznJ+9XD6S
         CsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577105; x=1796181905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qDfRfDw6DCEw9cU7eDAJn3dXH6hhXfWNmdSaNn6QIt4=;
        b=ugZwS84oJajQ49kGgZJSuvGQHA6jAzcfHw2Vxoa36vCTvvSfWAI5k4ZXIWaZs0D/YC
         tIpCzPfJY50ubMRwXabLXn9D/ZOcHC24s4KpxR5pchd2hHyBPF5Mgpu3ARUlIEMpfzVE
         FXR7ce4yIW4coVIZgxCQW8lcjtdLemKe2iAokm7wB5H8QTNh7bKm1zfeSEdzWJxSzwdF
         wJobriijGmNR+bNm2LLF+vZQbFslpYHg5J8PkEGXDg3hLgs1xNySRAgZo1kgN3B66uJF
         fGsAlTziwKniv8X33c4/9r8SbX1qyCaEWsA8DPWt5eyihnhjOYjgBgpc+40SP6hb4l7w
         pzHg==
X-Forwarded-Encrypted: i=1; AL+hErEKRIepcsatRN7kHDVR70iPjDlikBYdQ8t3RQO35AIUI+VC89HQ+gjCzXsNjIataraxOwF2Dyi277kDJA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+UWDS+BtSeWoHBoO6ZX1zWmXusIqQwZKX0J2KyA7P9N2GWTflY
	2xR/OGhLJHaChmh1YAO8uQ5/7xLqfLitR2iAKPwv+pjga5rJrkh7N6YcBiTe9rncL+Q3V/y8Rw+
	IzLsobNtoM6I8iS9/95nKVWC8w6fKFmCRPzZ4+6HFeybUtgT5d3QZAQ37L98jDXB4cQ==
X-Gm-Gg: AZFdTZcfz4pzfmYr9Ri3DgwkLJIz5jAGVfXdBCj7mYn+CbXvc8GlyiDvbwMWgqNn2Ud
	Wqf5zLUNQqDgGaIOYVg8kIQFRY/qpXjAXyrYsKhP0vw5adc0+5VY86YVOs6OLpSI6EFgktc1dsh
	UDfyi3tUxD5nUjEH1NihIsZYU45WXoqQgN/svaJ34WCTovIs4qpQlvaxXqChBG9kg94m6knLbh7
	E5nNQ7nobLe8sVmaV6ymqsl+Y6ZqeinkRX9BT/gsqlLzhUSp3k7/pjhfhtFoQPs7yteCY4BHlLb
	U89DZCrskNrFJabbT2yxAYDGzB/OZKYPH1yFAYU9IoDgYTQmw8Ac4WoVUpsBIdhTCNnjJMh56yv
	aVXBQKZ0sBbA35suTopOBUXu0aWiwB8Ynq62EtucRa2sEEvZxIv76jk1g2bAiVG8XTEUatooy4v
	DIcfi2+98=
X-Received: by 2002:a05:6a00:2d06:b0:8a5:cd1a:218c with SMTP id d2e1a72fcca58-8c87ce328b7mr14303508b3a.42.1795577105335;
        Tue, 24 Nov 2026 19:25:05 -0800 (PST)
X-Received: by 2002:a05:6a00:2d06:b0:8a5:cd1a:218c with SMTP id d2e1a72fcca58-8c87ce328b7mr14303476b3a.42.1795577104810;
        Tue, 24 Nov 2026 19:25:04 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm4762399b3a.25.2026.11.24.19.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:25:04 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 08:54:09 +0530
Subject: [PATCH v12 2/9] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
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
Message-Id: <20261125-glymur-v12-2-5c34dfd73fc2@oss.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
In-Reply-To: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795577086; l=8575;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=IPsZho0Ix8yYX8eTqSsvR0L4SWb0Li9sLLgel+chTDM=;
 b=VOhj47GCVZrm0JaJ57MYwAGdrwAGgJckZ0doqsgVxHr1vEzIBnhHwoMKWV3mT0gOcI5d2fQJU
 e85ZtRm6DGjCnCaZ0ff6hxlMyOEEmI8D6UmtccagKYJLh9mu7bdHIbD
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX6/kLrv3sdjHM
 jJ93WW0BORSW3aOAJDKRqKEvVjBN5ErLb8tz+X+dvMiBiar/gsvIxex4xl4iKXyN/BfMNQH1ANm
 DdT3y/WI/tu+GRqluCJvDxv5uRQreyvRGzkRHtRHfXR5vwTQf4hQIE6rrU1N4TLB8vJ5zY1AEOW
 5OYx2D/4Ot2Ps9QTOU7uEXByDqdDaccqqc1wrdhCfIhvudPk+kafpW2EUJQAmh6dsb/wsokfZXP
 aLl+RNUXLgQRPTKX5gigXd18tdE+Qw8C7iE6VnrtKzwQZXfsLp6LjMbUfkCuBA8I+IbSe2bSlO4
 SaNlpteZVEX/qkQSUmvO9CPEowo2CGH9HxSq9GiOhshYSRQW/4UTB+R7kQkixegl/vrEQyyiQ7B
 MRi4XaQ+b/kQyKGTH5bsnCIRoMFjddPZaPK9jC4VR8TwQYaS89KQvg/p04slZmSg5CPXqqPon8j
 rEFxshhu7Ciz1Hx5dXA==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b065512 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gsvzk-epdriNwW7vwuEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: Lvo_7dmJ9CNdatU7HV1HIfHlDvru0SlO
X-Proofpoint-ORIG-GUID: Lvo_7dmJ9CNdatU7HV1HIfHlDvru0SlO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX9c98S+0Z6pfc
 p6fsAnfTZ9865MGWYVBh6eMJtKzP2wb+313M2rOmGYEERrBaFyxjfTD7Bi8fdTiBUcmUCitZIM1
 aWoFF3VRr5rQPgU1BXj9L7ZmHTHXoAY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250013

From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

On platforms where a hypervisor is present, all Secure Monitor Calls
(SMC) are intercepted. For qcom_scm_pas_auth_and_reset(), the hypervisor
registers a Shared Memory (SHM) bridge over the Peripheral Image Loader
(PIL) memory region so that TrustZone (TZ) can access it, forwards the
authentication SMC to TZ, and upon return maps the PIL region and
triggers the co-processor bring-up sequence:
HLOS -> Hypervisor(SHM setup) -> TZ(auth) -> Hypervisor(map+reset) -> IRIS

On platforms without a hypervisor, Linux drives these steps directly.
The SHM bridge infrastructure required for this is already upstream [1].
To isolate firmware memory in its own Input-Output Memory Management
Unit (IOMMU) context, a dedicated stream ID (SID) is required. This SID
is specified via the iommus property of a video-firmware child node in
the device tree. A firmware device is created from this node and mapped
to the SID.
The presence of the video-firmware child node is used to detect whether
a hypervisor is absent: when the node is present, Linux manages the
IOMMU directly; when it is absent, a hypervisor is assumed to be present
and these steps are skipped.
Extend the Iris driver to support Secure Peripheral Authentication
Service (PAS) on platforms where Linux manages the IOMMU, by creating
the firmware context device and performing the necessary IOMMU mapping
when the firmware device SID is present.
[1] https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380
@oss.qualcomm.com/

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
 drivers/media/platform/qcom/iris/iris_firmware.c | 66 ++++++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_probe.c    | 12 +++++
 3 files changed, 73 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 236824d06c3b..f5b0a9440b3a 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -42,6 +42,8 @@ struct qcom_ubwc_cfg_data;
  * @dev: reference to device structure
  * @np_dev: reference to non-pixel device structure
  * @p_dev: reference to pixel device structure
+ * @fw_dev: reference to firmware device structure
+ * @pas_ctx: PAS context for authenticated firmware load and shutdown
  * @reg_base: IO memory base address
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
@@ -92,6 +94,8 @@ struct iris_core {
 	struct device				*dev;
 	struct device				*np_dev;
 	struct device				*p_dev;
+	struct device				*fw_dev;
+	struct qcom_pas_context			*pas_ctx;
 	void __iomem				*reg_base;
 	int					irq;
 	struct v4l2_device			v4l2_dev;
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 21f57d37da18..7797e1b34e39 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -6,6 +6,7 @@
 #include <linux/firmware.h>
 #include <linux/firmware/qcom/qcom_pas.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/iommu.h>
 #include <linux/of_address.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -14,6 +15,7 @@
 #include "iris_firmware.h"
 
 #define IRIS_PAS_ID				9
+#define IRIS_FIRMWARE_START_ADDR	0
 
 /* Detect Gen2 firmware by scanning the blob for:
  *   QC_IMAGE_VERSION_STRING=<version>
@@ -173,9 +175,11 @@ static void iris_detect_firmware(struct iris_core *core, const char *fw_name,
 
 static int iris_load_fw_to_memory(struct iris_core *core)
 {
+	struct device *fw_dev = core->fw_dev ? core->fw_dev : core->dev;
 	const struct iris_firmware_desc *desc = NULL;
 	const struct firmware *firmware = NULL;
-	struct device *dev = core->dev;
+	struct qcom_pas_context	*ctx;
+	struct iommu_domain *domain;
 	struct resource res;
 	phys_addr_t mem_phys;
 	const char *fw_name;
@@ -184,13 +188,20 @@ static int iris_load_fw_to_memory(struct iris_core *core)
 	void *mem_virt;
 	int ret;
 
-	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
 	if (ret)
 		return ret;
 
 	mem_phys = res.start;
 	res_size = resource_size(&res);
 
+	if (!core->pas_ctx) {
+		ctx = devm_qcom_pas_context_alloc(core->dev, IRIS_PAS_ID, mem_phys, res_size);
+		if (IS_ERR(ctx))
+			return PTR_ERR(ctx);
+		core->pas_ctx = ctx;
+	}
+
 	firmware = iris_load_firmware(core, &fw_name, &desc);
 	if (IS_ERR(firmware))
 		return PTR_ERR(firmware);
@@ -209,12 +220,26 @@ static int iris_load_fw_to_memory(struct iris_core *core)
 
 	memset(mem_virt, 0, res_size);
 
-	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
+	core->pas_ctx->use_tzmem = !!core->fw_dev;
+	ret = qcom_mdt_pas_load(core->pas_ctx, firmware, fw_name, NULL);
+	if (ret)
+		goto err_memunmap;
+
+	if (core->pas_ctx->use_tzmem) {
+		domain = iommu_get_domain_for_dev(fw_dev);
+		if (!domain) {
+			ret = -ENODEV;
+			goto err_memunmap;
+		}
+
+		ret = iommu_map(domain, IRIS_FIRMWARE_START_ADDR, mem_phys, res_size,
+				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
+	}
 
 	if (!ret)
 		iris_detect_firmware(core, fw_name, mem_virt, res_size, desc);
 
+err_memunmap:
 	memunmap(mem_virt);
 err_release_fw:
 	release_firmware(firmware);
@@ -222,6 +247,18 @@ static int iris_load_fw_to_memory(struct iris_core *core)
 	return ret;
 }
 
+static void iris_fw_iommu_unmap(struct iris_core *core)
+{
+	struct iommu_domain *domain;
+
+	if (!core->fw_dev)
+		return;
+
+	domain = iommu_get_domain_for_dev(core->fw_dev);
+	if (domain)
+		iommu_unmap(domain, IRIS_FIRMWARE_START_ADDR, core->pas_ctx->mem_size);
+}
+
 int iris_fw_load(struct iris_core *core)
 {
 	const struct tz_cp_config *cp_config;
@@ -233,10 +270,10 @@ int iris_fw_load(struct iris_core *core)
 		return ret;
 	}
 
-	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
+	ret = qcom_pas_prepare_and_auth_reset(core->pas_ctx);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
-		return ret;
+		goto err_unmap;
 	}
 
 	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
@@ -247,17 +284,28 @@ int iris_fw_load(struct iris_core *core)
 						     cp_config->cp_nonpixel_size);
 		if (ret) {
 			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
-			qcom_pas_shutdown(IRIS_PAS_ID);
-			return ret;
+			goto err_pas_shutdown;
 		}
 	}
 
 	return 0;
+
+err_pas_shutdown:
+	qcom_pas_shutdown(IRIS_PAS_ID);
+err_unmap:
+	iris_fw_iommu_unmap(core);
+
+	return ret;
 }
 
 int iris_fw_unload(struct iris_core *core)
 {
-	return qcom_pas_shutdown(IRIS_PAS_ID);
+	int ret;
+
+	ret = qcom_pas_shutdown(IRIS_PAS_ID);
+	iris_fw_iommu_unmap(core);
+
+	return ret;
 }
 
 int iris_set_hw_state(struct iris_core *core, bool resume)
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 3c6c170a3d75..c239e1a6a465 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -257,8 +257,18 @@ static int iris_init_cb_devs(struct iris_core *core)
 
 	core->p_dev = dev;
 
+	dev = iris_create_cb_dev(core, "video-firmware");
+	if (IS_ERR(dev))
+		goto unreg_p_dev;
+
+	core->fw_dev = dev;
+
 	return 0;
 
+unreg_p_dev:
+	if (core->p_dev)
+		platform_device_unregister(to_platform_device(core->p_dev));
+	core->p_dev = NULL;
 unreg_np_dev:
 	if (core->np_dev)
 		platform_device_unregister(to_platform_device(core->np_dev));
@@ -269,6 +279,8 @@ static int iris_init_cb_devs(struct iris_core *core)
 
 static void iris_deinit_cb_devs(struct iris_core *core)
 {
+	if (core->fw_dev)
+		platform_device_unregister(to_platform_device(core->fw_dev));
 	if (core->p_dev)
 		platform_device_unregister(to_platform_device(core->p_dev));
 	if (core->np_dev)

-- 
2.34.1

