Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230953C1F41
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455317; cv=none; b=trWcFh8KYhdEqCbRjjCzIlJgqJak8dPrgT2HaxUM9xer7VVjnYy2/xx2JLRT89nF46mak+K0nQmVgCUKVvc3qyGiEzMitW2ey14B7btRvWnymaNi4CohOYJL0+F+KqC7aADCBx4GYNIo/H1tc2OeWPU7X1h8Wk7oXx3t0wOJ0NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455317; c=relaxed/simple;
	bh=r4z6U5le9f5i6tabCU7RTnAD4wLjmvc2ekh6Lekl/2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PFKy8FPOKdxXCzVsDu0PUYQcpZxYpLzAq/u4cQ0fC533uLWq/EFgwWi41ke55hclNbriM1LR7uqzW9GtlrLstllrmgbD0Mldn+M/P7CIpaviNqOjVEU+s46hm7gxJtTe3T71dBdNvOgiJEUvakoQVsBE+psI0Hw60BW5EVzNM+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HOSL3m8m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PAILDVnM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HOSL3m8m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PAILDVnM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMrejM2206736
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nPUKAkYHtkVER0wMvhAoFQRO3uFZFLS15ocKoi9GKJY=; b=HOSL3m8m94DyRt4+
	rwE82FgCkbfBUIDw2ggqCJ86aphd0kGu8qqBg47DBCMWm/aUOe5EPPd05NeT4Wh9
	ja5If4afuGETHFkfwTXLHzfP12lMZzWJWiHieByA5wffpoKtUun68oW/GLg5ycy2
	/uEhPetpCpBuds0sQQEfbm5iL9q8UBqQc/09kBCdzVjpokYVH1QlqBq8S6dyTPL1
	t3gM+MNgu7rBIFqY8dircJ/ZT599brwnJ39+T7xFi48Utu5kNUB5RzkMkVED1MOj
	5KkroqW4qq184YY/WNzY7Or+li+qH0vh4qoX+RwXiOURFOf9Kh6lCFhqQ8cif2Xu
	Eirzzw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfrfr4ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-933023a5980so64708785a.3
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455313; x=1786060113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nPUKAkYHtkVER0wMvhAoFQRO3uFZFLS15ocKoi9GKJY=;
        b=PAILDVnMvsO3PvjWkCzuIlVkEESGPiizLx7bJ7B1KXo3vvAF6u6nAJpf+2VxarATY+
         ik0l7uT01dCROreuB6k5tz10ntWVXEOuin3T5F7B98EyWq7inR/cej1yKSrLDnBaL1y2
         kLlnKkNnZzcjWD2IymLQlAxVZjr9baZ97oFFRFqT8bfIoSZj000kkPprfI9hQ8ul56Qf
         6vPWvbHYfZFxu5Nx9omyCn/A2shhTrVGhyBlA5JvS7hqf662iI6NA436FNR827Zwj6we
         aOm+yMbXz3EsuDJM1Px2F2m3o7IHx3BEOVgqUeDxuDSjt/q0Xv1Z9X2i5MNglnh9rr90
         cw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455313; x=1786060113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nPUKAkYHtkVER0wMvhAoFQRO3uFZFLS15ocKoi9GKJY=;
        b=A4Rylxu1pN5ZHLANLTaBj0uWbHogN/lBdb84NjjDJz/wVw9IgoqSq3FIz+/ctE6H4L
         BPRqxqhm9T6oETte9PkJCsglGxO+/6En9hTD6e5MnQm3U9cKu7/JlXWEgmmJRpQclZ2e
         AuuZ2zX4oe0HmYC+VKnq1Yu67JMzfVI9eIW4GAwalgTefLRT6QHWHayxIUIZbt5zPnuP
         N+6X1cDfRkCwP1/8rmUmwGgUw7C5XyTm3E5m6xbp/tVooA9XpPswNVdUgCXcrVm49Npw
         h8HI9jfejBU2cSoJ/MQnTOpocbbfxqbYVPIw9DusnZu66MuzLWVPVC7IxX9yL6mIa6kq
         qadw==
X-Gm-Message-State: AOJu0Yyj9AormxbVnXDcAprJ70nLZa5pzOTs0YQrIMQf0s5Q2cg0MmAE
	fUiv6oe4Ot8dyKN5Y5qqCRCmIUy/MFxEaY408ulkFGXMUooUb/3LLDdVMqUALhwX5zdYR3Fc4A3
	J2zkRkVPWzlsSGu651TOumdRLcMBQkUs2Q9u+UjfoqBmwvh/0g7pHZPyF8/AZFvPS3g==
X-Gm-Gg: AR+sD100XY8F53gKUPr2KFZuAV2AyTispTPx1NsoeJT/VBi69PgtG3Sz5U/nTenrV+0
	i6IB6rKGeosMI7MCSFRcF7WscS9EZYHEoHO/omuf4ytgrkmYAnOIgu8rmePdQdJlkdoOch1Mfz6
	l38UM3BfdD7vC2TS6G9x0XO1+kQaR0dp/J+LQd5Lo2ZzUkVE5Ff8a3zM2n/siZgr9K4Y81+qy0O
	cRhbIUXqEDOZQa9Yds/BVMC60y+dvGYz0BDdM6v6BT/DEThusFLfFUiWLg73fwTjJFfMYTmvz/d
	AxX8T41d3YQBxE2hwUUiaOEXGPokcsx+sbQqJiKMfIwtgcknE1fXHYYO/Hlm7CRQPBvBx/kW9/7
	74T1ANdCiidMOVRnHhMPgo5lPAmK6Yf4Ks8t/KhJkavnLJdnBXrYZlm2T0knvNLjPMMzjOlp8IV
	nBZETLc2y0Dc/jUQ==
X-Received: by 2002:ac8:5ac9:0:b0:51c:730:a587 with SMTP id d75a77b69052e-52b38700b62mr52201381cf.63.1785455312945;
        Thu, 30 Jul 2026 16:48:32 -0700 (PDT)
X-Received: by 2002:ac8:5ac9:0:b0:51c:730:a587 with SMTP id d75a77b69052e-52b38700b62mr52201111cf.63.1785455312433;
        Thu, 30 Jul 2026 16:48:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:48:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:22 +0300
Subject: [PATCH v9 01/19] Revert "media: iris: Add Gen2 firmware autodetect
 and fallback"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-1-d71a782001c0@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11761;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=r4z6U5le9f5i6tabCU7RTnAD4wLjmvc2ekh6Lekl/2Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+LJlubG92AgJJRtVibHit4s/uLkndlPD0TgJ
 TR2I3Z0SxyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamviyQAKCRCLPIo+Aiko
 1a+pCACCJpKJxNXzR3Yr9nOhEtC4h6C3AiPc1bCQyIrnL5+dlT1wpIXsD5GyvLJxn4hw8/SYohM
 +24cmKEH03C1gyIe/6WL2gI/KChy9H9bh1wfQWv6PVBRlon45ZM/fA9fkNLlufmOaksvbJM1hgA
 mvhjhkoL61cj2+f0bu0P8w7y21kLLYH5h87ReHOBCcKyN5ksIKfzcIonQXBTJxzfgC5e6ZxbRkN
 reI+Dy7BPb8W+BAW0rdbN7xB0ArQsR/blex02w1ao/fAJbG5BI95d6/OXCwojw9h3iNmuU8aODD
 zvFnTXQHvDR7zDktI4chtCW3UAj/0bCVJvaVh3cPv1/pRu4G
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfXx4N26URw22sq
 erqWqrF68GW79EptQkSVnm1VBILZPJvbukC4dlSyXMu01kQUYBu8APMX9ZZaUKx650W3ZWAzW5P
 RYbgdry5mPXyEc4/TFlrPqoQzef0/pA=
X-Proofpoint-GUID: R6Bq4lMUwCrhMrZ1-azgDItSnKIJr-YS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX4unzSFkwRLXk
 1PYUWPl9Ihc6jmavYZNaQJqLdiXSqRh73c5TuBxFOOgeKaQ2J1I+HCkFr/X/biOvOxTW1lnUwCb
 cioFfQ6yInhqJdqaao/W3FtElvW2GFZyN4Py7F6qhnXd/lnmbGzdedZd5JF5OU4LKcGSNXlogWp
 +iNBwgWBgdJ4zBxHYodxtlGT06kJi9Wxhw3Ke9l2zGQZZZYMgUfGuRbB0JVOZVX37P8INF3Z8Aa
 TIhc/ZLjFy8QmQcTQQVW0MduvSPHWO+lKZo4aWF/YD3HT39SKdaCMIfXNz6ORXtJGWwE9kzuw1i
 buSDMBt/CEQfbbw+PU9gmO5jaFeAhMbfzIUQr9coeH0CtsCwJdTTdc1wEGELwvaPu8eKAAakKIL
 ZtYtGJRF11aLJJzyK7m6mbbejUrKVKFevMFmmQ4Kb3UMBUXVl8zT38yWFI5r11llzJcdXKLrTwO
 QXteoB+uQto2sJFIUpg==
X-Authority-Analysis: v=2.4 cv=N+kZ0W9B c=1 sm=1 tr=0 ts=6a6be2d1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=bd8amR3KYVc8_5-X3PEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: R6Bq4lMUwCrhMrZ1-azgDItSnKIJr-YS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300168

The commit 412a2e5955e0 ("media: iris: Add Gen2 firmware autodetect and
fallback") added support for detecting the firmware HFI interface based
on the firmware contents, but it has issues with the MDT split files and
with synchronisation / locking. Revert the commit, it will be replaced
by the better version.

Fixes: 412a2e5955e0 ("media: iris: Add Gen2 firmware autodetect and fallback")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_firmware.c   | 119 +++------------------
 .../platform/qcom/iris/iris_platform_common.h      |   6 +-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 +-
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  10 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   3 -
 6 files changed, 33 insertions(+), 120 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 965384fdd339..1a476146d758 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -16,109 +16,20 @@
 
 #define MAX_FIRMWARE_NAME_SIZE	128
 
-/* Detect Gen2 firmware by scanning the blob for:
- *   QC_IMAGE_VERSION_STRING=<version>
- * and then checking:
- *   - version starts with "vfw", OR
- *   - version matches "video-firmware.N.M" with N >= 2
- */
-
-static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
-{
-	static const char *marker = "QC_IMAGE_VERSION_STRING=";
-	const size_t mlen = strlen(marker);
-	static const char *vfw = "vfw";
-	const size_t vfwlen = strlen(vfw);
-	static const char *vf = "video-firmware.";
-	const size_t vflen = strlen(vf);
-
-	for (size_t i = 0; i + mlen < size; i++) {
-		const char *found;
-
-		if (memcmp(data + i, marker, mlen))
-			continue;
-
-		found = data + i + mlen;
-		size -= i + mlen;
-
-		/* vfw => Gen2 */
-		if (size > vfwlen && !memcmp(found, vfw, vfwlen))
-			return true;
-
-		if (size < vflen ||
-		    memcmp(found, vf, vflen))
-			return false;
-
-		found += vflen;
-		size -= vflen;
-
-		/*
-		 * video-firmware.1.x is Gen1.
-		 * video-firmware.2.x and video-firmware.10.x are Gen2.
-		 */
-		return size >= 2 &&
-			(*found >= '2' || (*found == '1' && found[1] != '.'));
-	}
-
-	return false;
-}
-
-static const struct firmware *iris_detect_firmware(struct iris_core *core,
-						   const char **fw_name)
-{
-	const struct firmware *firmware;
-	bool has_both_gens;
-	int ret;
-
-	*fw_name = NULL;
-	if (core->iris_platform_data->firmware_desc_gen2)
-		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen2;
-	else if (core->iris_platform_data->firmware_desc_gen1)
-		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
-	else
-		return ERR_PTR(-EINVAL);
-
-	has_both_gens = core->iris_platform_data->firmware_desc_gen2 &&
-		core->iris_platform_data->firmware_desc_gen1;
-
-	ret = of_property_read_string_index(dev_of_node(core->dev), "firmware-name", 0, fw_name);
-	if (ret) {
-		*fw_name = core->iris_firmware_desc->fwname;
-		ret = request_firmware(&firmware, *fw_name, core->dev);
-		if (ret && has_both_gens) {
-			core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
-			*fw_name = core->iris_firmware_desc->fwname;
-			ret = request_firmware(&firmware, *fw_name, core->dev);
-		}
-
-		return ret ? ERR_PTR(ret) : firmware;
-	}
-
-	ret = request_firmware(&firmware, *fw_name, core->dev);
-	if (ret)
-		return ERR_PTR(ret);
-
-	if (has_both_gens &&
-	    !iris_detect_gen2_from_fwdata((const u8 *)firmware->data, firmware->size)) {
-		dev_info(core->dev, "Gen1 FW detected in %s\n", *fw_name);
-		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
-	}
-
-	return firmware;
-}
-
-static int iris_load_fw_to_memory(struct iris_core *core)
+static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 {
 	const struct firmware *firmware = NULL;
 	struct device *dev = core->dev;
 	struct resource res;
 	phys_addr_t mem_phys;
-	const char *fw_name;
 	size_t res_size;
 	ssize_t fw_size;
 	void *mem_virt;
 	int ret;
 
+	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
+		return -EINVAL;
+
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
 	if (ret)
 		return ret;
@@ -126,11 +37,9 @@ static int iris_load_fw_to_memory(struct iris_core *core)
 	mem_phys = res.start;
 	res_size = resource_size(&res);
 
-	firmware = iris_detect_firmware(core, &fw_name);
-	if (IS_ERR(firmware))
-		return PTR_ERR(firmware);
-
-	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
+	ret = request_firmware(&firmware, fw_name, dev);
+	if (ret)
+		return ret;
 
 	fw_size = qcom_mdt_get_size(firmware);
 	if (fw_size < 0 || res_size < (size_t)fw_size) {
@@ -157,12 +66,18 @@ static int iris_load_fw_to_memory(struct iris_core *core)
 int iris_fw_load(struct iris_core *core)
 {
 	const struct tz_cp_config *cp_config;
+	const char *fwpath = NULL;
 	int i, ret;
 
-	ret = iris_load_fw_to_memory(core);
+	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
+					    &fwpath);
+	if (ret)
+		fwpath = core->iris_firmware_desc->fwname;
+
+	ret = iris_load_fw_to_memory(core, fwpath);
 	if (ret) {
-		dev_err(core->dev, "firmware download failed %d\n", ret);
-		return ret;
+		dev_err(core->dev, "firmware download failed\n");
+		return -ENOMEM;
 	}
 
 	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
@@ -184,7 +99,7 @@ int iris_fw_load(struct iris_core *core)
 		}
 	}
 
-	return 0;
+	return ret;
 }
 
 int iris_fw_unload(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 974809509146..a9453d539fc2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -292,7 +292,11 @@ struct iris_firmware_desc {
 };
 
 struct iris_platform_data {
-	const struct iris_firmware_desc *firmware_desc_gen1, *firmware_desc_gen2;
+	/*
+	 * XXX: replace with gen1 / gen2 pointers once we have platforms
+	 * supporting both firmware kinds.
+	 */
+	const struct iris_firmware_desc *firmware_desc;
 
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index bbdbf21961d7..fa5bb143158d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -29,12 +29,6 @@ static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
 	.fwname = "qcom/vpu/vpu20_p1.mbn",
 };
 
-static const struct iris_firmware_desc iris_vpu20_p1_gen2_s6_desc = {
-	.firmware_data = &iris_hfi_gen2_data,
-	.get_vpu_buffer_size = iris_vpu33_buf_size,
-	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
-};
-
 static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -106,8 +100,7 @@ const struct iris_platform_data milos_data = {
 };
 
 const struct iris_platform_data sc7280_data = {
-	.firmware_desc_gen1 = &iris_vpu20_p1_gen1_desc,
-	.firmware_desc_gen2 = &iris_vpu20_p1_gen2_s6_desc,
+	.firmware_desc = &iris_vpu20_p1_gen1_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
@@ -136,7 +129,7 @@ const struct iris_platform_data sc7280_data = {
 };
 
 const struct iris_platform_data sm8250_data = {
-	.firmware_desc_gen1 = &iris_vpu20_p4_gen1_desc,
+	.firmware_desc = &iris_vpu20_p4_gen1_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 74626b35d9cb..2c63adbc5579 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -90,7 +90,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.firmware_desc_gen2 = &iris_vpu30_p4_s6_gen2_desc,
+	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -119,7 +119,7 @@ const struct iris_platform_data qcs8300_data = {
 };
 
 const struct iris_platform_data sm8550_data = {
-	.firmware_desc_gen2 = &iris_vpu30_p4_gen2_desc,
+	.firmware_desc = &iris_vpu30_p4_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -154,7 +154,7 @@ const struct iris_platform_data sm8550_data = {
  * - controller_rst_tbl to sm8650_controller_reset_table
  */
 const struct iris_platform_data sm8650_data = {
-	.firmware_desc_gen2 = &iris_vpu33_p4_gen2_desc,
+	.firmware_desc = &iris_vpu33_p4_gen2_desc,
 	.vpu_ops = &iris_vpu33_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -185,7 +185,7 @@ const struct iris_platform_data sm8650_data = {
 };
 
 const struct iris_platform_data sm8750_data = {
-	.firmware_desc_gen2 = &iris_vpu35_p4_gen2_desc,
+	.firmware_desc = &iris_vpu35_p4_gen2_desc,
 	.vpu_ops = &iris_vpu35_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -220,7 +220,7 @@ const struct iris_platform_data sm8750_data = {
  * - different num_vpp_pipe
  */
 const struct iris_platform_data x1p42100_data = {
-	.firmware_desc_gen2 = &iris_vpu30_p1_gen2_desc,
+	.firmware_desc = &iris_vpu30_p1_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 5db6398433a4..81cccb756b94 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -253,6 +253,8 @@ static int iris_probe(struct platform_device *pdev)
 		return core->irq;
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
+	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
+	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
 
 	core->ubwc_cfg = qcom_ubwc_config_get_data();
 	if (IS_ERR(core->ubwc_cfg))
@@ -271,6 +273,8 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	iris_session_init_caps(core);
+
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index fcbc60016bee..1c052ca235be 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -9,7 +9,6 @@
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
 
-#include "iris_ctrls.h"
 #include "iris_vidc.h"
 #include "iris_instance.h"
 #include "iris_vdec.h"
@@ -197,8 +196,6 @@ int iris_open(struct file *filp)
 		goto fail_m2m_release;
 	}
 
-	iris_session_init_caps(core);
-
 	if (inst->domain == DECODER)
 		ret = iris_vdec_inst_init(inst);
 	else if (inst->domain == ENCODER)

-- 
2.47.3

