Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173094;
	b=FQe5FtHHvOd5C+kfRWsD4Ot3lhSsO1UAA5a+YLBB+CKQWx67V9bn0gGkVvmfihDDl3Y4
	 Bv08n2ZFsmFIzLuRhlAUl/MwYxKrQANec7IUKU1L5kJVZzT3rs3wvfTImgJbY0+yPXG7s
	 Dc0fZw0I8rtRppw44gsUe30RcDktvauYA3l8ZeEmnUvTND4r/xnPV+ZUVecaRLNFzEqht
	 roXs25aYa8SVVkDzssXGxt7bi7Qoeq/ALgYg/H8xX2kF3Em3a7E5RdDQd8YpwK+UEVhG4
	 VRanrCW+ywo3WuXf7IviDa12zwddTLAP6pQH0v20LhD10JsubSjK3MvWzO5NFnJvV7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173094;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=z35r7zkccuSTk0hX+/sGIrSPymjmK+o3T2HJpVZS+Eo=;
	b=dE2yf5rYhIxxbEQ6gir9CBAbY9zs0Tx/4uV6ixN/g/ISn6mlKUh0soDj6F+xFpUY77m/
	 QrtxvbqxQ5FX71T03KnhamPXocUZ09I8LVxTqfNb98yVt0bCd0Wr6IcCS/HPvvNAUcZhU
	 VEsp3FvdR48lKn8671kk/8RLbbKsWBZriAm1mwV/c+/R3dtKMnHzEkaDqu7rox5tDeFNL
	 8voLYqIUzl9pBZCyqj2N072Uee2cD5YzhLaYBiAEr/y6VCsy5vRxc76FP8XBHHleHP78w
	 OImq01jEbc/hluY1AffbnNPLgcFzJpvm9Stl54nu3gsz1Vcw585XxotqtWMZCS51YzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZrarcjEO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MVwp0pmg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D15D60A2639
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D15D60A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZrarcjEO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MVwp0pmg
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkib03107703
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z35r7zkccuSTk0hX+/sGIrSPymjmK+o3T2HJpVZS+Eo=; b=ZrarcjEOINZbaXt5
	bOniYTtLEfvWF8mpy9zanMgoolURDBYH0h4oZp9PHDr+dazlgPWJThLQ4MF6UlJJ
	ghOW066bE85pTVdVboQDMlKtHSRYI5/jc7WxmhJ+4tCuloPx7Ve7uAD3El+YPG8t
	3dum141sxokcprIbHW76sDHs71wKUHU0MtNPpPggh7WTac+s5Bp7oChJgMWyjuN7
	kNKARfFobpR/SrH2nEGxelFCYKO6zEeAgt71iNvu0sTG7EwezyhHyGYDYDDE0jVV
	HOTaaYtgfmLtEJgIVTTla7aBaUkLVHKCUthJsixs6TiIeIKixaxAIxvzqUvWEa06
	tqrBCw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3cgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:11:33 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1af203073e0so893807c88.1
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 03:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173092; x=1795777892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z35r7zkccuSTk0hX+/sGIrSPymjmK+o3T2HJpVZS+Eo=;
        b=MVwp0pmgpg7t6p+qINaswqTorloIHdgNcBRZFMzTlLLED11Z+tmOB8Usa34dpZSP/m
         bsx06rwxU9xKP9RWC2yNqKKBHbz8pT2WjRNkfJ1dRMrwtcugCpreF8VHq5OgfljufEpr
         sUzNZGUdeMhTgESRIzpHosFJQXqiAKYtfsQbiFd3mdRwMJxVGQVM6lZLzbTWME5RgzUW
         dHqCvHaZb2Wl0nUbhKaFJpImXy4rz2IefczSs1dzRVUf1FFE2yNOjBanwacv3dOEU6rB
         kf8+8d5Iu/YNhjEQucSTE5TlG2+UC9PgB3FWEhJa2OPg4szGj50ZbnmNmZuLaMgaRuel
         LIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173092; x=1795777892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z35r7zkccuSTk0hX+/sGIrSPymjmK+o3T2HJpVZS+Eo=;
        b=lzGxevTsuoaeXeG1T29+vzhreBftwksBZcNQvwf2uFVboyVRIPy9TuvVKNs6C2rwL6
         My7g5vvpXSXevcKWz77Yu4muTFvcOj4cRLapeXZ8ukEExzumR9/USVKCZjwDELTCrvo+
         sLqF8cgWPfRcovfhrYkBxU8mNEcuJSKIBHY4rbXYqbwNJIXMkweCbLbHrrousL1jhyOp
         WoqTJHhDz5pbsn+moAFkx+GczVpMAgJslm3LK68a0ClhMXTwclqrqmvtmKF4F6X488Sz
         CGCvGrIJELJpon9d+z0BJVltNxmXVi9a2L3osT4csiwogxbXgGynB8m9JKxRfnsdenmH
         42RA==
X-Gm-Message-State: APuU4Z8MstPTh87pKGs+pApPYStToa69tWgA7FL/CmiDnd2SbpbLd2sH
	c/jlKq7+5eGMTe5ZBB62Ydj+VJcflpbbDx+uojGcAJ0HVqN1Y0RPBrGnymcJ8oSgu3o5SNao6hq
	Ir18htOAheR3jal2JJXYGCGysQO/OMm2W6WOS5FA2nJ+AAYf4yJptjoyokYUtrpkwww==
X-Gm-Gg: AYBFou2b8R6PpxrqRlLdZmmV18AtCJnrW7C/VWRanuaquAN595ii3Eij512p4I9HqjO
	5n/HkurK8UPy2fZWSmJ5ZMNSWAqHhmjq0DemlqqFa9EhljdS49XOiEZzgUfjdT8fMRmMmGNnW0O
	yzhJ9Icv/h1j5Pff7V276YNGwQnX+GwWUUL0RveuWiMhXx/qQObrm03wpJROnZqEUvD5dRw4Ix9
	z6at0LUMT/4aQ2lHR0KfMlQdH8eRhsZqOIl2m2cUce2NyA1ymHX4HP9kFHxrUoQsQ0mKhwIJJcd
	xJ5hWzlkuONWMuF5NqJwemfkyYqdT1UeVgjE8Z71bYqbZS3B6n07prVA545q8JeqzFIyALwmUN5
	qWFHr1eaDpC30sOLI51zF1Y23sDG+73KCg9qxPiFwwidbkKrZRvwUaYmYAumaZTJMao2pmtfmhi
	02luSGkFCu
X-Received: by 2002:a05:701a:8148:10b0:143:2719:f800 with SMTP id a92af1059eb24-1b556908ecdmr2340193c88.40.1795173092054;
        Fri, 20 Nov 2026 03:11:32 -0800 (PST)
X-Received: by 2002:a05:701a:8148:10b0:143:2719:f800 with SMTP id a92af1059eb24-1b556908ecdmr2340148c88.40.1795173091432;
        Fri, 20 Nov 2026 03:11:31 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:31 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:40:54 +0530
Subject: [PATCH v7 04/12] media: iris: Add non-pixel and pixel context bank
 devices
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-4-25a771235a7f@oss.qualcomm.com>
References: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
In-Reply-To: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=5826;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=8H0P4ddJnokiuKN13cprMhw/Zb8moRSMQ2sLTECuERc=;
 b=ydGkGahgKa74r0eBoQ9TzSZdEGYLaPLK4AAPAIObp1ZuAZfCH1VICsfJFB7B6qiFe7A/TcPo/
 qZ3D642vDrZB7Qju4NHrO7WKxVrKqTLookHXtGhxj+x3gqa/GiRtUZG
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX5+DpfNkEHum8
 j692/8I2ppYYkAojs1oA8m9pUnVA31edERorhO+SAWJHyVsYv08LScxPGVpo6Obi3XLCcflYBw2
 BBUIMEQrEYxAYOmtlhWZiga9U0yHbjrIIMIjSPaUHZzcrUTueJT+Hxt9NcnErz8mYIlMeXniUOW
 qNGTkovkNEcTJqYGQ669ZRqpMM5NkbEZks6cn/d6d79g8LzpXq1URd2Qb9Cf+qquQl9VM0zjGlz
 YRXOLwJBRsRZPhk8EU6vrmMapkSRqxmsuNC8UM3/eOkerlTVFRCnlCkPEPu8gZVrGBtieladY3O
 0UWT7sLIpfil9RjXd7j33Ht91Z8EKWr7YkjrSr+ySNs5eFrxJfwT9f99i4a5RKwsfAADmtMXffV
 wMQooyjc54Sfc2VUDiKf2Ang1txwLFkUKe9sQjftDKkA3I1QBzdJV4UE9cl0fxtKDxvzqmYcclW
 VfB2Vpr7HFimrH00BIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX8GVK+nijejZr
 Ddu5V6m+f2lD1dzl33kfvCtmjppipwRZQxgVm2DXc2JtsN0LafUfcdvBTgSjOqN303J2U9n2z9w
 wWEufKCIpUKbm+QUIiLWksQaT8kN0lc=
X-Proofpoint-ORIG-GUID: LvtDChPN2ycSCWWl6AGVAVKwRhdow0qU
X-Proofpoint-GUID: LvtDChPN2ycSCWWl6AGVAVKwRhdow0qU
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b002ae5 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=FR9WZtxvUMymXjMYBvMA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Now the device tree describes "non-pixel" and "pixel" as separate
context bank subnodes, each carrying its own "iommus" stream IDs.

Add helper functions to create and clean up devices from these DT
subnodes, and call them from iris_probe() and iris_remove(). This
applies to the common probe path as it is required for all platforms.

Set the context banks before v4l2_device_register() so the DMA plumbing
is in place before any video device is visible to userspace, and tear
them down on the probe error path and in iris_remove().

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h  |  4 ++
 drivers/media/platform/qcom/iris/iris_probe.c | 71 +++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 3aeab49600e4a4742e1a8b141d1fedd219d8dbc5..236824d06c3bb7a3618bd24182f74c309a18bc29 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -40,6 +40,8 @@ struct qcom_ubwc_cfg_data;
  * struct iris_core - holds core parameters valid for all instances
  *
  * @dev: reference to device structure
+ * @np_dev: reference to non-pixel device structure
+ * @p_dev: reference to pixel device structure
  * @reg_base: IO memory base address
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
@@ -88,6 +90,8 @@ struct qcom_ubwc_cfg_data;
 
 struct iris_core {
 	struct device				*dev;
+	struct device				*np_dev;
+	struct device				*p_dev;
 	void __iomem				*reg_base;
 	int					irq;
 	struct v4l2_device			v4l2_dev;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index a086e519a55fea8649480a91d191fa3528fd2eaf..8b45a062a510dd0e96824e90d4398f9ef9294709 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -203,6 +203,72 @@ static int iris_reserve_iova_region(struct device *dev, struct dma_iova_state **
 	return ret;
 }
 
+static struct device *iris_create_cb_dev(struct iris_core *core, const char *name)
+{
+	struct platform_device_info plat_dev_info = {};
+	struct device_node *child_of_node;
+	struct platform_device *pdev;
+
+	child_of_node = of_get_child_by_name(core->dev->of_node, name);
+	if (!child_of_node)
+		return NULL;
+
+	plat_dev_info.dma_mask = core->iris_platform_data->dma_mask;
+	plat_dev_info.fwnode = &child_of_node->fwnode;
+	plat_dev_info.name = child_of_node->name;
+	plat_dev_info.id = PLATFORM_DEVID_AUTO;
+	plat_dev_info.parent = core->dev;
+
+	pdev = platform_device_register_full(&plat_dev_info);
+	of_node_put(child_of_node);
+	if (IS_ERR(pdev))
+		return ERR_CAST(pdev);
+
+	if (!device_iommu_mapped(&pdev->dev)) {
+		platform_device_unregister(pdev);
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
+
+	return &pdev->dev;
+}
+
+static int iris_init_cb_devs(struct iris_core *core)
+{
+	struct device *dev;
+
+	dev = iris_create_cb_dev(core, "non-pixel");
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
+
+	core->np_dev = dev;
+
+	dev = iris_create_cb_dev(core, "pixel");
+	if (IS_ERR(dev))
+		goto unreg_np_dev;
+
+	core->p_dev = dev;
+
+	return 0;
+
+unreg_np_dev:
+	if (core->np_dev)
+		platform_device_unregister(to_platform_device(core->np_dev));
+	core->np_dev = NULL;
+
+	return PTR_ERR(dev);
+}
+
+static void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->p_dev)
+		platform_device_unregister(to_platform_device(core->p_dev));
+	if (core->np_dev)
+		platform_device_unregister(to_platform_device(core->np_dev));
+}
+
 static int iris_register_video_device(struct iris_core *core, enum domain_type type)
 {
 	struct video_device *vdev;
@@ -249,6 +315,7 @@ static void iris_core_release(struct v4l2_device *v4l2_dev)
 {
 	struct iris_core *core = container_of(v4l2_dev, struct iris_core, v4l2_dev);
 
+	iris_deinit_cb_devs(core);
 	mutex_destroy(&core->lock);
 	put_device(core->dev);
 	kfree(core);
@@ -377,6 +444,10 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = iris_init_cb_devs(core);
+	if (ret)
+		goto err_unresv_iova_region;
+
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		goto err_unresv_iova_region;

-- 
2.34.1

