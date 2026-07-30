Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E756408026
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455321; cv=none; b=FTGC/MI/SHR+8TZ6KvZIunrB2nm3SMICoFUkWkyQsIxxJ7KAQSGvoIuFNapQ3jC7wveI4TWtpuswIiEyERt3fk4CYQXubJgp7/o4jUN9XVV3mi1ImJcYgGsWVFhUaSX93eI812aHNBJ2K6XQSf0fh58SfMUqEfrHInZBiIB+Ss0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455321; c=relaxed/simple;
	bh=wsQuQdeXxny5DqDtLdvjRx5ctTVaGE9I3JRJav7j6I8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kjoIHVUTQ3y5y84Ekvh5+o8lHgQf81lNEciRmtD7hJYw5FDSx1n3GzD5Kso6KG9vIcq+1Cuq5yfrbtiDCtC3OJEv3kh3GOp+ZLOKLcuhndzzKZTh0V/1Gzsy/xcrYAUsMBKhpeyLNRHIfad9+t4qeG5K11VIuwta3NUPR151DuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lHyhVmbN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K+LE5dad; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHyhVmbN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K+LE5dad"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMs4Wv2479497
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RiSMTUd439dP8/Dp6JEFU4I86JHv2MdRsiVkm4Y6TKA=; b=lHyhVmbN/acFqYvC
	2xKMhOYj6cDYGWNg1BlCayLmKwwYUtUL4p8Q0XL6G0/UReod/3nVKZbsHmUGnmLN
	i+SWB60g0ss1knyahzjDrV8eaKzkrTseiwkR3L83lw6CV0K/IlEiHlSp7LLry2I2
	LGgzuf/DHKnwB07VN9mON87Bbz7dG2/RGretK64M3tG9oN6UENPZPeVvd0gBayqe
	y/cUZ4TcPcmfSx8hRjAM9+qivwX79nZeDCaoukPJwzv3PaSi5JpnMDMRLeHyiET0
	BKE2L4Q/A46ch+jHRAlEuPk0TQIn/1JfY/6BpNbbYBD2uhbMHKqQU8y38tal/N0Y
	gXEPlA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfpfr4s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so3346111cf.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455317; x=1786060117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RiSMTUd439dP8/Dp6JEFU4I86JHv2MdRsiVkm4Y6TKA=;
        b=K+LE5dad9cKWAjnxVVKT+kgus6F9T3Lz3m1XTw55cueqNHijb3fxJ0Tms5NnF/zopd
         ftE7NUQmO8GgpCtx/e59bymHSn4fawtWJ4PtcLi+S7ZGVDZfTjtKpYYeGCeJ4jfjL517
         FVBQZQldsawA8CZfiAPZlUc5DblewPUXzuub39VHB3QRE2l2/HvWDc9brX/4ugQPXMBj
         NkjoF6P0mIo7ZhcsVMCPiMnOveFOLNL46aYRW901grBJl2fgrkBj5Tvl2bo4N+eteADD
         cPzIYFPBM6qPtiUj4Gt7DermRYaTyHqmO0zuwst7NAW2bQarixcXe9s7VScKAL8LS3B6
         r9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455317; x=1786060117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RiSMTUd439dP8/Dp6JEFU4I86JHv2MdRsiVkm4Y6TKA=;
        b=V3xariZp6W4UNFoyb0AETW4L/EMeJFVEGV+C62/IUDWTn8hfavdCGweQXU1B6UNNl1
         u57fMKrp9knovq8txXWfe0QH+H/z0Fuw807tPVp6rtkOFa3PgUmloYZQpT8s5dcEUHAU
         h5zKmr9qFVfz63Ywo/B0e984SVfQyDXL3ss/b6ryZpxApG2aFcFOD8P2ANX0L1PP69uP
         iAFJ9i29ZTbAvBXsKjlHp8JWWULHBR6x3vsw2hwygaAIZxmmM12Ik5bF6zm7SWgsCMnj
         v8zm8jyIL3h4VYokuLBbeP1bjcxPVJpESoqeUyTWXh2G0TiFavAYaCfFGYL8sTayNfWs
         3soQ==
X-Gm-Message-State: AOJu0YyKE3bCIvjwgeSefQhyZPubAndyZXNMIbDC/eFoCTjH+T2rLot9
	QoHJSYXQuqg/pWD+Ap6jTmR6/NpNG1iz//IbFVB3f0KZyrrLPyy04a+KAb+d9bnJHVBQTPm1CiW
	OQdVcsvZS1NJYjC/sK+ax9LptBpbBfFd2QenBOQvsv+vDFzF/YTsYzUCWicEOpSlriA==
X-Gm-Gg: AR+sD100omnmPPzhSQFRaq/i59MQ+lWT/VIEJyG/FttD4LMqCpsqKd7UyfTNQZFDaTz
	fmbzmhepT8T+M1Hbs0Ch3LUB4EOClDZChcZ2u50GXIpSGDGsuI86AZzhSTq4y+Z62I0n6oxsN9p
	vLhWeOvETuphR9EL/5Diqzsexav9Z/UbtZyOQHpdrmsszCQf19zJA/UGEjDazWnJEXM87dkBVt1
	FkuXeSI3yJHDSbrc5yWUilxMRc/BOk6+XvFvUsZTnr6ggWuDvwEHXMduoh+Q3rmf8uvdbkLhCQF
	At32dTKC+Ef34h8yA54U8xgpb6laAjwbPLnDYIRHcQIm6r0nSjkvWPemROh9ggvghgsRyx2NlQ7
	mewIhUjbxjkYSOa6OHbsDkY1s8jdUJQ3Edm8n7Tu7dX72C/VmwzVqxc+yfHy1hnw7yyM5iLIID9
	Sc2uAgf2DpCWC35w==
X-Received: by 2002:ac8:5f10:0:b0:51c:db4:3cb2 with SMTP id d75a77b69052e-52b386ae57bmr53133001cf.63.1785455316895;
        Thu, 30 Jul 2026 16:48:36 -0700 (PDT)
X-Received: by 2002:ac8:5f10:0:b0:51c:db4:3cb2 with SMTP id d75a77b69052e-52b386ae57bmr53132771cf.63.1785455316355;
        Thu, 30 Jul 2026 16:48:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:48:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:23 +0300
Subject: [PATCH v9 02/19] media: iris: Add Gen2 firmware autodetect and
 fallback
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260731-iris-ar50lt-v9-2-d71a782001c0@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17368;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OddETrjfI6cBT0fTSRIDpKbM1AIqOJxlQaBWDV/yFBo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+LJjOXvSTFC2/jnE34fIevrxHCujZxueDpa+
 VOi6Lk5+xKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamviyQAKCRCLPIo+Aiko
 1bLTB/9R4Glb+v+5u34QDVYT7DCtFX/KveBMll8h5MRYghkqJmH3Hg/4vYlmKWJxI3nxEr78kbc
 28iHj307bvDEokZY9wWaAtIToyK996rwalvsV8pgUaBphpNli2VMRIZxMucTz4UC1KRgmCuemUI
 fHhXZ2/XGlhu3ywRHRjHZx0sDxgncLcuUJ8sRdg7tGCrjNqmMoIlQccnAzEJReFnb0zxctNGn+e
 RTRLoZCg4A8GbfmOjyKWrX7jFYHwA1SBd+iSnQ98Tdqs976xgtTgNSTsPq1ufEjZIruNi8B4SsQ
 9+KqfEIqGYOrzLltS9cNhZ9UvYsKD+uiwGVp6ADrwpnS8kyn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX/uJX9D7KY5RZ
 6yzNWp/azWWUWvI4zpsNlWoVYKaiY9VuOHWvzEt7LmHxlB3LoeP4zg/f3Ks8m5/e2ZdmnrEGFJ6
 tcMTGlfhdfHl4qwmgCyRlF2dhC09JcN/iURlfh9lZC8t9KLkp604UiECv6T6jlKA3N1Lc6sPCZT
 XQxdHTC2UnijgWuLWfN9v31OjPZ8V0PPQ+NEfmFm/OwxnIocm8mHpII8NmpeEzHXfLlct+ljCa6
 hLjvsf4FcYZ+ucZDr+bHBOZ+DaBR7mTsCqM4+VSpjglUioODniXVBiXiWYrjRHjlwqFdYDpwb/q
 vu82PEIJO6EQwqeyQipUNTrcaUh2CTwgq8zFXKp6oon10AQZxIvs4PZitMyUMJXX9cLt6Zje66E
 Xov4o7sks9eG1Bq9dCWcYCq8zDrFiPz2z9YgPoGK0XBkhwReXCprBwg27jKBnCYRkdrSa34uS2V
 AoBq/XsoCqy5VbFZvDA==
X-Proofpoint-GUID: sMb4VRsr7N7RJwWPil03CanX1hcS51F1
X-Authority-Analysis: v=2.4 cv=XNEAjwhE c=1 sm=1 tr=0 ts=6a6be2d5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=4FHYMocE7i0MHXyxtNQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: sMb4VRsr7N7RJwWPil03CanX1hcS51F1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfXwQH65C1nBtBk
 2nFTAwEpDKisUS2VQmrmmXCloCmzTrgOTW1gqpyI2XLvOdJ5rHG1SSc1BeRdQFplr41lGVIc2zF
 YPpeZ6u9sHGk8IE6+2s2LJU0Q8/0o3o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300168

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
Update the firmware loading logic to handle this generically by
preferring Gen2 when available, while safely falling back to Gen1
when required.

The firmware loading logic is updated with the following priority:
1. Device Tree (`firmware-name`): If specified, load unconditionally.
2. Gen2 default : If no DT override exists, select the Gen2 firmware
   descriptor when present and attempt to load the corresponding
   firmware image.
3. Gen1 Fallback: If loading the Gen2 firmware fails and a Gen1
   descriptor is available, retry with the Gen1 firmware image.

Loading and generation detection are split into two steps.
iris_load_firmware() applies the priority above and returns the loaded
image together with a candidate descriptor. iris_detect_firmware() then
runs only after qcom_mdt_load() has succeeded and publishes the chosen
descriptor, so the driver commits to a HFI generation only for an image
that has actually been loaded.

When a platform provides both Gen1 and Gen2 firmware descriptors and the
firmware is loaded via a DT override, the candidate descriptor is only a
default: iris_detect_firmware() inspects the loaded image to pick the
generation, before authentication. It scans the memory populated by
qcom_mdt_load() rather than the request_firmware() blob, so that a split
.mdt image, whose version string lives in the .bNN data segments and not
in the ELF headers, is classified correctly. The firmware is classified
as Gen2 if the QC_IMAGE_VERSION_STRING starts with "vfw" or matches the
"video-firmware.N.M" format with N >= 2.

If a Gen1 firmware image is detected in this case, the driver switches
to the Gen1 firmware descriptor and associated platform data so that
the correct HFI implementation is used.

This change makes firmware generation detection platform‑agnostic,
preserves DT overrides, prefers newer Gen2 firmware when available,
and maintains compatibility with platforms that only support Gen1.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       |   2 +
 drivers/media/platform/qcom/iris/iris_firmware.c   | 188 +++++++++++++++++++--
 .../platform/qcom/iris/iris_platform_common.h      |   6 +-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 +-
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  10 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 -
 drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
 7 files changed, 188 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 8c335dbfce16..676baa8087a8 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -6,6 +6,7 @@
 #include <linux/pm_runtime.h>
 
 #include "iris_core.h"
+#include "iris_ctrls.h"
 #include "iris_firmware.h"
 #include "iris_state.h"
 #include "iris_vpu_common.h"
@@ -85,6 +86,7 @@ int iris_core_init(struct iris_core *core)
 		goto error_unload_fw;
 
 	core->iris_firmware_data->init_hfi_ops(core);
+	iris_session_init_caps(core);
 
 	ret = iris_hfi_core_init(core);
 	if (ret)
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 1a476146d758..ea3b3a9793e8 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -14,22 +14,175 @@
 
 #define IRIS_PAS_ID				9
 
-#define MAX_FIRMWARE_NAME_SIZE	128
+/* Detect Gen2 firmware by scanning the blob for:
+ *   QC_IMAGE_VERSION_STRING=<version>
+ * and then checking:
+ *   - version starts with "vfw", OR
+ *   - version matches "video-firmware.N.M" with N >= 2
+ */
+
+static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
+{
+	static const char *marker = "QC_IMAGE_VERSION_STRING=";
+	const size_t mlen = strlen(marker);
+	static const char *vfw = "vfw";
+	const size_t vfwlen = strlen(vfw);
+	static const char *vf = "video-firmware.";
+	const size_t vflen = strlen(vf);
+
+	for (size_t i = 0; i + mlen < size; i++) {
+		const char *found;
+
+		if (memcmp(data + i, marker, mlen))
+			continue;
+
+		found = data + i + mlen;
+		size -= i + mlen;
+
+		/* vfw => Gen2 */
+		if (size > vfwlen && !memcmp(found, vfw, vfwlen))
+			return true;
+
+		if (size < vflen ||
+		    memcmp(found, vf, vflen))
+			return false;
+
+		found += vflen;
+		size -= vflen;
+
+		/*
+		 * video-firmware.1.x is Gen1.
+		 * video-firmware.2.x and video-firmware.10.x are Gen2.
+		 */
+		return size >= 2 &&
+			(*found >= '2' || (*found == '1' && found[1] != '.'));
+	}
+
+	return false;
+}
 
-static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
+/*
+ * Load the firmware image and return the descriptor that was used to pick the
+ * file. On a platform that provides only one generation, or when no DT
+ * firmware-name override is present, the returned descriptor is final. With a
+ * DT override on a dual-generation platform the returned descriptor is only a
+ * default; iris_detect_firmware() inspects the loaded image to confirm it.
+ */
+static const struct firmware *iris_load_firmware(struct iris_core *core,
+						 const char **fw_name,
+						 const struct iris_firmware_desc **fw_desc)
 {
+	const struct iris_firmware_desc *desc;
+	const struct firmware *firmware;
+	bool has_both_gens;
+	int ret;
+
+	*fw_name = NULL;
+	ret = of_property_read_string_index(dev_of_node(core->dev), "firmware-name", 0, fw_name);
+
+	/*
+	 * A platform may support both Gen1 and Gen2 firmware; which one is used
+	 * depends on the firmware image installed on the system, not on the
+	 * hardware. That installed image does not change while the device is
+	 * bound, so the generation is detected only once and the chosen
+	 * descriptor is reused on later core bring-ups (e.g. after a system
+	 * error recovery).
+	 */
+	if (core->iris_firmware_desc) {
+		if (ret)
+			*fw_name = core->iris_firmware_desc->fwname;
+		ret = request_firmware(&firmware, *fw_name, core->dev);
+		if (ret)
+			return ERR_PTR(ret);
+		*fw_desc = core->iris_firmware_desc;
+		return firmware;
+	}
+
+	has_both_gens = core->iris_platform_data->firmware_desc_gen2 &&
+		core->iris_platform_data->firmware_desc_gen1;
+
+	if (core->iris_platform_data->firmware_desc_gen2)
+		desc = core->iris_platform_data->firmware_desc_gen2;
+	else if (core->iris_platform_data->firmware_desc_gen1)
+		desc = core->iris_platform_data->firmware_desc_gen1;
+	else
+		return ERR_PTR(-EINVAL);
+
+	if (ret) {
+		/* No firmware-name in DT: select by probing Gen2 then Gen1. */
+		*fw_name = desc->fwname;
+		if (has_both_gens)
+			ret = firmware_request_nowarn(&firmware, *fw_name, core->dev);
+		else
+			ret = request_firmware(&firmware, *fw_name, core->dev);
+		if (ret && has_both_gens) {
+			desc = core->iris_platform_data->firmware_desc_gen1;
+			*fw_name = desc->fwname;
+			ret = request_firmware(&firmware, *fw_name, core->dev);
+		}
+	} else {
+		/* firmware-name given: iris_detect_firmware() picks the gen. */
+		ret = request_firmware(&firmware, *fw_name, core->dev);
+	}
+	if (ret)
+		return ERR_PTR(ret);
+
+	*fw_desc = desc;
+	return firmware;
+}
+
+/*
+ * Detect the firmware generation and publish the descriptor. Run only after
+ * qcom_mdt_load() has succeeded, so the driver commits to a HFI generation
+ * only for a firmware image that has actually been loaded.
+ *
+ * The generation is detected from the loaded image (@data / @size point at the
+ * reserved memory region populated by qcom_mdt_load()) rather than from the
+ * request_firmware() blob: for a split .mdt the latter holds only the ELF
+ * headers, while QC_IMAGE_VERSION_STRING lives in the .bNN data segments.
+ *
+ * The descriptor and firmware data are published exactly once, before any
+ * session exists, so the lockless readers in the ioctl paths never observe a
+ * reassignment. Later bring-ups reuse the already published descriptor.
+ */
+static void iris_detect_firmware(struct iris_core *core, const char *fw_name,
+				 const u8 *data, size_t size,
+				 const struct iris_firmware_desc *desc)
+{
+	if (core->iris_firmware_desc)
+		return;
+
+	/*
+	 * With a DT firmware-name override on a dual-generation platform the
+	 * image on disk decides the generation, so inspect it and switch to the
+	 * Gen1 descriptor when a Gen1 image was loaded.
+	 */
+	if (desc == core->iris_platform_data->firmware_desc_gen2 &&
+	    core->iris_platform_data->firmware_desc_gen1 &&
+	    of_property_present(dev_of_node(core->dev), "firmware-name") &&
+	    !iris_detect_gen2_from_fwdata(data, size)) {
+		dev_info(core->dev, "Gen1 FW detected in %s\n", fw_name);
+		desc = core->iris_platform_data->firmware_desc_gen1;
+	}
+
+	/* Publish iris_firmware_data first, then iris_firmware_desc (the guard). */
+	core->iris_firmware_data = desc->firmware_data;
+	core->iris_firmware_desc = desc;
+}
+
+static int iris_load_fw_to_memory(struct iris_core *core)
+{
+	const struct iris_firmware_desc *desc;
 	const struct firmware *firmware = NULL;
 	struct device *dev = core->dev;
 	struct resource res;
 	phys_addr_t mem_phys;
+	const char *fw_name;
 	size_t res_size;
 	ssize_t fw_size;
 	void *mem_virt;
 	int ret;
 
-	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
-		return -EINVAL;
-
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
 	if (ret)
 		return ret;
@@ -37,9 +190,9 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	mem_phys = res.start;
 	res_size = resource_size(&res);
 
-	ret = request_firmware(&firmware, fw_name, dev);
-	if (ret)
-		return ret;
+	firmware = iris_load_firmware(core, &fw_name, &desc);
+	if (IS_ERR(firmware))
+		return PTR_ERR(firmware);
 
 	fw_size = qcom_mdt_get_size(firmware);
 	if (fw_size < 0 || res_size < (size_t)fw_size) {
@@ -53,9 +206,14 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 		goto err_release_fw;
 	}
 
+	memset(mem_virt, 0, res_size);
+
 	ret = qcom_mdt_load(dev, firmware, fw_name,
 			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
 
+	if (!ret)
+		iris_detect_firmware(core, fw_name, mem_virt, res_size, desc);
+
 	memunmap(mem_virt);
 err_release_fw:
 	release_firmware(firmware);
@@ -66,18 +224,12 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 int iris_fw_load(struct iris_core *core)
 {
 	const struct tz_cp_config *cp_config;
-	const char *fwpath = NULL;
 	int i, ret;
 
-	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
-					    &fwpath);
-	if (ret)
-		fwpath = core->iris_firmware_desc->fwname;
-
-	ret = iris_load_fw_to_memory(core, fwpath);
+	ret = iris_load_fw_to_memory(core);
 	if (ret) {
-		dev_err(core->dev, "firmware download failed\n");
-		return -ENOMEM;
+		dev_err(core->dev, "firmware download failed %d\n", ret);
+		return ret;
 	}
 
 	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
@@ -99,7 +251,7 @@ int iris_fw_load(struct iris_core *core)
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 int iris_fw_unload(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index a9453d539fc2..974809509146 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -292,11 +292,7 @@ struct iris_firmware_desc {
 };
 
 struct iris_platform_data {
-	/*
-	 * XXX: replace with gen1 / gen2 pointers once we have platforms
-	 * supporting both firmware kinds.
-	 */
-	const struct iris_firmware_desc *firmware_desc;
+	const struct iris_firmware_desc *firmware_desc_gen1, *firmware_desc_gen2;
 
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index fa5bb143158d..bbdbf21961d7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -29,6 +29,12 @@ static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
 	.fwname = "qcom/vpu/vpu20_p1.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu20_p1_gen2_s6_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
+};
+
 static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -100,7 +106,8 @@ const struct iris_platform_data milos_data = {
 };
 
 const struct iris_platform_data sc7280_data = {
-	.firmware_desc = &iris_vpu20_p1_gen1_desc,
+	.firmware_desc_gen1 = &iris_vpu20_p1_gen1_desc,
+	.firmware_desc_gen2 = &iris_vpu20_p1_gen2_s6_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
@@ -129,7 +136,7 @@ const struct iris_platform_data sc7280_data = {
 };
 
 const struct iris_platform_data sm8250_data = {
-	.firmware_desc = &iris_vpu20_p4_gen1_desc,
+	.firmware_desc_gen1 = &iris_vpu20_p4_gen1_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 2c63adbc5579..74626b35d9cb 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -90,7 +90,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu30_p4_s6_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -119,7 +119,7 @@ const struct iris_platform_data qcs8300_data = {
 };
 
 const struct iris_platform_data sm8550_data = {
-	.firmware_desc = &iris_vpu30_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu30_p4_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -154,7 +154,7 @@ const struct iris_platform_data sm8550_data = {
  * - controller_rst_tbl to sm8650_controller_reset_table
  */
 const struct iris_platform_data sm8650_data = {
-	.firmware_desc = &iris_vpu33_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu33_p4_gen2_desc,
 	.vpu_ops = &iris_vpu33_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -185,7 +185,7 @@ const struct iris_platform_data sm8650_data = {
 };
 
 const struct iris_platform_data sm8750_data = {
-	.firmware_desc = &iris_vpu35_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu35_p4_gen2_desc,
 	.vpu_ops = &iris_vpu35_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -220,7 +220,7 @@ const struct iris_platform_data sm8750_data = {
  * - different num_vpp_pipe
  */
 const struct iris_platform_data x1p42100_data = {
-	.firmware_desc = &iris_vpu30_p1_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu30_p1_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 81cccb756b94..5db6398433a4 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -253,8 +253,6 @@ static int iris_probe(struct platform_device *pdev)
 		return core->irq;
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
-	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
-	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
 
 	core->ubwc_cfg = qcom_ubwc_config_get_data();
 	if (IS_ERR(core->ubwc_cfg))
@@ -273,8 +271,6 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	iris_session_init_caps(core);
-
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 1c052ca235be..84d70beec350 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -9,6 +9,7 @@
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
 
+#include "iris_ctrls.h"
 #include "iris_vidc.h"
 #include "iris_instance.h"
 #include "iris_vdec.h"

-- 
2.47.3

