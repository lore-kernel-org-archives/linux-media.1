Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655909;
	b=Qr/nXSUdJsj2rxATVLFq+69RfX81/iPqAWPtoKYsG9gEy2lMHpKeibbdpcQqIFB3Iq+M
	 tbhpRuvg23XXd85TyDADffS7zqVthDU28Qq2qGpbUvpL0vHaYMXohNhNIM9OCa/3vfM7L
	 USazbp4NIZy9+AFLNysdG3ddReJ51nrTNRvLjvO3waG9AcLKdjitR3bvWbsIFasYDkG8W
	 f8o1nKgevQeAGeDZxgMKF7mjVQjqoIxhPjW7io50gNR447ql5GFvOcxC2ekWVKL1XjJ/o
	 PNrJuyAcZAYjQhG/bxVnr2dJEmznxtbbeIU9LE2Gm/lsHSQA0jKsSFVTBuV/OqjWO8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Fq0eSwayBFJV2y635upNqo1ZfKf4GK2LSEcREJOfams=;
	b=3pP2Q6guXQaTRTN4HqIfjrPFM4D4u+SdkaTHMlVWQuOWZZI3o+dFOnc3P38AwQECdXWZ
	 7fqzBJu63JUM7a+ysYznbpjVzDPBGpPhuriBxfF8DD9D87jw5kdp9aIPxfWbTIy3T2wZB
	 f6NSGlaTK6siNfb5pw9csG/ux/I8mTiUqSypMgWTMl8QSdenRaVR8q5zPDH6D9pyvEUK9
	 gi+BDkW98ZQogXuZMDwh1JP4WyrWTBSoDN8Ql3wexqfV0n75LEQFZQkOQBbEGadIEuiEN
	 wBgFYEiQ6/cF0jxyaywkbXXRVMdLETK/12EMyRMJjSLkS+qqBlZUgk7JMaPzxgC91TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ioivrY6L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HhaghYD0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBFF606A331
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DBFF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ioivrY6L;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HhaghYD0
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wX13174146
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fq0eSwayBFJV2y635upNqo1ZfKf4GK2LSEcREJOfams=; b=ioivrY6L5LVUM5Gs
	kZGmM45sTcU6CRkqLf/EW7hft8Z1+cRa06wrCnUCbyKlYtyRLb2g16yJ1zY6Ws3N
	HzLJTcfsKAY/l8hzlI/o16ClZeSUfjxemgkjE5JMaNy17k17Qc7r1uQY1PLQFNbu
	38FSjnZsEm3btj3ad9OxH741dIwfShVKdIa9uR3GxkmmxXbFWAU9uU3a5hziZvXI
	3TM1R/LoXzj5AjiB+6+iZ0ZGsA1fY1fxiiKux6sW26XND9s9mKyGh50B3EO771yQ
	rhSF5nQbSmWrUZYtwJmiAzZKynFfmmqd4KgAaGvKINsx1A00Z9LnzCGGyTuBR3w7
	f53aCg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmagkkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:31:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91e8b51c11dso31802776d6.2
        for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655907; x=1795260707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fq0eSwayBFJV2y635upNqo1ZfKf4GK2LSEcREJOfams=;
        b=HhaghYD0p3nzup7vOE+i5QoHaAPb7+fdNPJH1aPdUJTtdhtrOHQk27QdszqkbBlQu7
         EDMT5i5Dq93GqtDEkdj/2yVmklcweo5unZSk23INWasX6qHLsRThclRXdyKYUWN3VfpO
         zPxZeQL7ulF6MQxYilNmmg+3sJfoMDxbT6DPMu5AQ0j+s77XKC01OeK/hiTSHtRjTxih
         K2v1AjfyivjQLbqaPI87cJ6Vp3F1uXKZVCo8k33O+V7bGocki3dUJyhiJmHtBQqaC/wJ
         ardf5oUEK08rbFrbB60gNk1rVC+JiFOfxRL1AzH/IgM7uaxUQ7E6sz60N5ZrI7OOr71v
         tvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655907; x=1795260707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fq0eSwayBFJV2y635upNqo1ZfKf4GK2LSEcREJOfams=;
        b=DWiGAvlUX7w9EQXkWIGU5FUGxTTSAzI8+kGrrBc9EPNHZurbIS2mgMEif4sAjTCtDz
         GzVnkIy7wd/mlhAZGfp75pHBWwOPavuLFZnXJs3LgFQ8ok4jKW5fB9hNcZ62HnJ73eGy
         HzX5K7XUgRNf+tHmjCKPlSaYnUUqWtEhmqxDgruD2FFeBzvvpORYgwJwUnhIDadCf9oI
         fsRKUU/erpC414mE8plOJAlseCNW0JsQhMZFwvQjnxiHVcgXPCnlJZlyVCU+yHKemNl/
         7kO5Bm9i5eOEQo2zUnBfysQReqS54HwsDRO9QBrDvPacO9fEZrODq+hHyQZN9cjc4opT
         8DhQ==
X-Forwarded-Encrypted: i=1; AL+hErH1+fS9yEWszoyLKbcvlkx1cJQog474zHlUOXCPA3py/s0jDsdVAJuGEKvoDSdm24gj3jblEC9py5K3Fw==@vger.kernel.org
X-Gm-Message-State: APuU4Z87rJi8iuboJMLNWHQIYChJ1giotImNHmI7Siu6XmrkaYSIq96X
	J92RyK9AZr2fpiTO70t7DYsKH4yXC1Joq3fqXB0ArjuyEdHurD9/Efq3WrfwTP5n/I6YYlWUpUS
	IndqqlSRmFs/4AD84qXTf0mbseg4UmrASUtxn/WiKOycRz1GQBxUI3knR22KBFDidhg==
X-Gm-Gg: AYBFou2J03wGA/9zVzb+T+xmntTJZxWj7SjIyNuDNT9LBuwSgyxI6nzR0j0e4ZIOFL+
	w7EljWjj6prR9yYwB9ATD74z3kzw7r/nuyxq1FewvZyNcmyAsMx+ZJfuxDrzv7c6A3ePBJ6HxXj
	dVVVtzDQJwAVMxnaS000wIhqm45e7WLdSC47Eqjuk1cfNCur9jk8pBNrbLNixMqbYGVqg4Uw/2G
	V6b9WiXBo1NO1WoPfD3LDK3+Y9hO+H0LKBr1Lb8vLmUdi9ZVS/hA0VUzTBXIrrF24nOeDQK/jvq
	o31+bryuKTsJrtXJq0L98ccOzBC/VxULEWJ8HHoA8PEGpip2baPtkbmWUWZcBhrankrUKQ6Ui+i
	yaPFaCXUTq1Y6FAj2UxfkrCGQlM/zh5gSX2UycDqdJ+H91wLoOFBzupkfmVqHxO5/ZVu+gC3/F3
	9Sr6NkirSteZmr3A/8wNF6+8Lx0zR0k+S+DLsWnuWQ
X-Received: by 2002:a05:6214:c8d:b0:91f:3204:f150 with SMTP id 6a1803df08f44-91f3204f27dmr40312696d6.48.1794655907340;
        Sat, 14 Nov 2026 03:31:47 -0800 (PST)
X-Received: by 2002:a05:6214:c8d:b0:91f:3204:f150 with SMTP id 6a1803df08f44-91f3204f27dmr40312426d6.48.1794655906915;
        Sat, 14 Nov 2026 03:31:46 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:31:41 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:30 +0800
Subject: [PATCH v7 13/23] media: qcom: camss: Add Eliza compatible
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-13-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=4231;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=MGcvrm40G1MvJFbNKYdvpmfRzh1tNKV72j31vx5Ra34=;
 b=I0BIVZb/mptxCXOKqa2wQH4o4PnpereymYjEMuJVi02OM4IRfEkK1BFjhxX5F2gObDKBnCE1k
 0HF70lOK+vyCS3GE59fAVtuJjSlr/9iLOaCfpt6WAOlEOMMMuHOPuZz
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: 3xXxMkdTYDEYOqot_HpdWoXuXIVWWwo-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXwoCuQoMd88nU
 2Z4cVfZSuxXnPRPjfZ6dIf3k1n8jCdpheq/1bims7WE2WpMGJDJ9HbWCOJPuZ3+0AvYdrHLa4XW
 CJawiNzQgAH830Av9qR8kTCXc3u+5AkjgYbD4OsOS8nyTvHYj1/n2FqlxVEUZ6lfEhj/VgWuHnE
 nE8kxYMWKhlaFcGozTr6XrzpEdStJEvV6D03ZNHyad4JFDvJ4qh7oxZ4eDAeF6kzcG4V3g/LMXY
 4e58BHsVadajQO1SxZEU8gu3rLwTMWm7Q9Gfub+0j/e0CFaLxOow221ULSJMQ3Wi0T2WbbdNvvP
 CmOmt0D8uVYm8lwOz5A7hDenvBNFg6l8J4DXJW0V09Cqm55CReePzFX5J3AmJDVuKrNn5qAwDXm
 bNv9q+7j8ldWl7rIflpyRSfU86Ep45Rk6IuDPzgB9S34KK9M+kPSoDUGKrPMr5DIUPQCF4r2Pf9
 /hK86a1bRty5yvwRQSA==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6af846a4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-cpAvnqLVGaxAupx5UIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 3xXxMkdTYDEYOqot_HpdWoXuXIVWWwo-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX2HzkBAz1pJMg
 M19J8IzdEBVtnnSCqM1p6jdVgUF7q2Ml5AiHHIWLchSImyFgVf3/YR3LRC9JrhKbXOOqGKzWELk
 1wx8xG9u2wGg0xBoTqI+lfHCzkUCMf8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

Add CAMSS_ELIZA enum, Eliza compatible and Eliza CAMSS driver private
data. Eliza has 3 CSID + 1 CSID Lite, 3 VFE + 1 VFE Lite and 2 TPG
instances. CSIPHY resources are not listed because the PHYs are probed
standalone.

Eliza's CSID 970 and VFE 970 are register compatible with the SM8750
CSID 980 and VFE 980, so reuse the SM8750 CSID, VFE and TPG resources.
The only difference is that the VFE RDI write master client IDs start at
20 instead of 23.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-980.c |  5 ++++-
 drivers/media/platform/qcom/camss/camss-vfe.c     |  2 ++
 drivers/media/platform/qcom/camss/camss.c         | 16 ++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h         |  1 +
 4 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-980.c b/drivers/media/platform/qcom/camss/camss-vfe-980.c
index 47f6c18190acfbf3c6ab49186fc73fde6a0ac799..ecdfaa4d528aaacd97aae6335c6488de09cf6e12 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-980.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-980.c
@@ -83,8 +83,11 @@
  * RDI3			3
  * GAMMA		4
  * STATES_BE		5
+ *
+ * On Eliza (VFE 970) the RDI0..3 write master client IDs are 20..23.
  */
-#define RDI_WM(n) ((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
+#define RDI_WM_BASE(vfe)	((vfe)->camss->res->version == CAMSS_ELIZA ? 0x14 : 0x17)
+#define RDI_WM(n) ((vfe_is_lite(vfe) ? 0x0 : RDI_WM_BASE(vfe)) + (n))
 
 static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 7a20d9c1a350da183959f9ae024ef6f53cbd0c1c..3992516d672ebd43184c2a82e238581bf693cbe2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -354,6 +354,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8650:
 	case CAMSS_8750:
 	case CAMSS_8775P:
+	case CAMSS_ELIZA:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
 		switch (sink_code) {
@@ -2020,6 +2021,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 	case CAMSS_8650:
 	case CAMSS_8750:
 	case CAMSS_8775P:
+	case CAMSS_ELIZA:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
 		ret = 16;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index de22ff74c7acfe912afea31dabc1ecc250b022b0..a6a0313eeabca5f2c8f8c7b569030ea5b0a5a848 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -6238,6 +6238,21 @@ static const struct camss_resources sm8750_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_sm8750),
 };
 
+static const struct camss_resources eliza_resources = {
+	.version = CAMSS_ELIZA,
+	.pd_name = "top",
+	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
+	.csid_res = csid_res_sm8750,
+	.vfe_res = vfe_res_sm8750,
+	.icc_res = icc_res_sm8750,
+	.tpg_res = tpg_res_8775p,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
+	.csiphy_num = 4,
+	.tpg_num = 2,
+	.csid_num = 4,
+	.vfe_num = 4,
+};
+
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
@@ -6255,6 +6270,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,eliza-camss", .data = &eliza_resources },
 	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 3da970d251e728d339d13fdaef23ea5dfa46dd3b..0f909a4a409b7d1476966aecfaebb4cd60871974 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -97,6 +97,7 @@ enum camss_version {
 	CAMSS_8650,
 	CAMSS_8750,
 	CAMSS_8775P,
+	CAMSS_ELIZA,
 	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };

-- 
2.34.1

