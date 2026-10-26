Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995841;
	b=U47WE5mtLeKhnx+eYANIhGmvHNqmaBD9VDNP1BEpArCB5GPBtEqhk/VQ9ffd6sOhgat9
	 PcPAt4AWw7depXJ6xXhkbVevvCA+02XARKbDTVmHqr9X7gtGYKBcB/UW+RhyFNbBlho3U
	 xo0mnMhpGL/92GbXrbaVFkX/7UyAaQIpg+0S0ZW+m8gOa3thZnUIJ5fJKgvZNXR6XivAQ
	 9SBmOU7s7mxOsP2O35qQcAulBmyMOas76FfAajxrNBzYhwMjIk4IAv91b7lgBqGqAb7Fl
	 +dvT21mNbtps+Eb4JG+HhN+NGAlGnjT4dKurH81hAThxvwx/BAPNc+h8QnTw6KWcKQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995841;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UOR+3mQqNWrrLiobLgmkq+PeJAutB1Cemy1/2B3AOYo=;
	b=AMxBljfsVNfqCBcdaSuqNJsMpFbrTOT6xk1OR1nb7NPd7e6FUqKGIceGfbCegvoP99Qo
	 iNUG/uSmccQ50rNgxqOeAJJpQr+B0mgWZQKfRy8GQPMZjygoH6ZK7/tH2byMSAqoMGjNS
	 LVDBh8qLhDsWvF+YylxTAhi37FFMTJl3a2e7s4pRUzLUn6yLIBbCb1Prd2O83DBJ49kwv
	 pD2wTEyBcvMVDdAZaB+eIaGSBQBwsqXdPW7/YnLxebXmiEk6cvWlBmA+deCQ8lqx+3HDG
	 kOU74X9vf1Ortt+MBv6p7YlBqu29lK6tKecx0cnj3Mn6UdJ50uTc5JlQVp0ikH2C7Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dRS16m5m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jd7fdwr4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D44D606A31B
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D44D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dRS16m5m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jd7fdwr4
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b6411182156
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UOR+3mQqNWrrLiobLgmkq+PeJAutB1Cemy1/2B3AOYo=; b=dRS16m5ms665/YuJ
	Br6BSa25BglOaVUYMDaXlJ/uSX/QpV0mpRKD61oClP+LUpAWEYxStU4EwUO7hnkJ
	jxgYutwnPits5c143mX5LemV7XGVjloM3+tGUkMa0S+tttGEGrpl9b0Hmkw4B1x/
	HanNbhsCSlJw1Dz0s6337gsZcwUhSYBISHXwmxkSyAIK1vX4ZmvtOt87m/f9Pn39
	cQt2Zyszk5Up+EJ0jQX3eHeWNiY+7txu6jGXuvTAXvdpEbreH4HLdrMZExPIZGah
	ICAmXeMImI+QRzO59OTo4WHTRxgArfTxwokNbh+7tN/i8mO1L6xLhj2+Ny887pCa
	KRgLxg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27w28t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:23:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd6ba724b6fso1270951a12.0
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 23:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995839; x=1793600639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOR+3mQqNWrrLiobLgmkq+PeJAutB1Cemy1/2B3AOYo=;
        b=jd7fdwr4zq2dKgjOFcpen3EGKG4ipx6aSXi61xRHmTxsPjXlVJ0Niy4ewmfSkpQMGR
         rHZGs9C3s7qd/+qx0hAW7bV+3mbH1PDbBvLmE/Fw1U5BnHQBU/x3Wdhuc2r12gfEgUPg
         imJUulfDPPJfhuUvgsvTJAmdZdgI6IWzShWYSCb/ZxZbrrakI2U5S0w5vtoHRKoW1F0P
         SeC69H9lcJz3nXnupGnzgwm2N1MkowgM4LXrPQELU4ZakCR7vZfH3O7odl75UogpaWg/
         cd3XYXFjI/tCpr+1WZkfLMH9yHfZdVKRJJ3FnYM5MuaBEbv+wxtkPkL4zgOO/VHX8RHP
         H6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995839; x=1793600639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOR+3mQqNWrrLiobLgmkq+PeJAutB1Cemy1/2B3AOYo=;
        b=AKhQYodaXbPTqWRtxFuriUxkApooG/8cdL4Npx1WF5XcMBl0NGJUi9b8Kp0fD1/ogS
         gB0vxm/ScaHrG4Kat37c1Sgm6lxPuBbwnT+N+uJsSp13FromY0X1lGUZbbJSbAbPuIkF
         vHJcwuIdvo6VSe7A+xUHw/xoKxYnpX+90hdJDp9i2lTSubafE5Cp/bgnYcVFF1WTXxLr
         6IyhOuUr7eYwlZ9MNjdFHwVu9AWm/+hDtBILIn1maufzUf7Z3oWFxBF3o6Eua/T+PUih
         vgTWRrjE3OM9bgGrkl2SoOeRiDI7rMmccnsRiBl02VzRqNNZHWBIFXf0HUTNfuYQVmJD
         nw1w==
X-Forwarded-Encrypted: i=1; AKwUvBx29Bo1osmRZRivwXjlxS3E3L4bx2pBYkEkbQQi06u+F0Z02QQG2bEdHPzZSVjl3UqRqncFFPL2x4Vq8w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIY6EA5eUCs8SK6mSKYzZiIbeea87Td2rlam4vlSw/Wake83jqz
	zHgPsWvVyGTEpMNOdQouPIEx3CW+yD9I9M0PPYc0ex+MnUB/PJylS+f87JxL7L2O0GM+LCLZrJI
	COViY8V/lVzE/gsdbbko7sx7JrSMlz8vO1tw0izNkT8TGujPOKJ4oszFaf5JSPF+CyQ==
X-Gm-Gg: AYBFou02LBK++if6DGosAMIC2VLTovmTGoLWIdjnZfMIo2s9iI+bvel2UUvBRkY2uHa
	QlhqOU8i/NTgatUlDpm6oiXM9ZM6+7+4mGwk3xSPcuLXLttX6dpA5vIfGkcporNrTTlawPnkazR
	oCCjbwfzcyHWhbWhm/eyyC7KBEbG0ChQBzPyaE8J4mgRCI0Vry3KIuY7KctGE24CFQGOXmHSM4F
	xZxyuxZ7kIAGnzSHnQd2qM+uAKiyYrqkz6Dejh9axdSCdNVwWF8MuFbDK6souRTdbMa1j3bjr9S
	Ubi1hTtEXjtrx6Jtm5HVWhD8qatuekQ6GWOatvUyvvq25Q4qVUNBRQbbRtw2Lkh+X/WcRovn31L
	vFYGL3rxW1naKf5roYMkHa/u5QZvAvVmV2A==
X-Received: by 2002:a17:903:3c6e:b0:2e9:6645:e9ab with SMTP id d9443c01a7336-2ea9c6c246amr54738005ad.16.1792995838554;
        Sun, 25 Oct 2026 23:23:58 -0700 (PDT)
X-Received: by 2002:a17:903:3c6e:b0:2e9:6645:e9ab with SMTP id d9443c01a7336-2ea9c6c246amr54737865ad.16.1792995838107;
        Sun, 25 Oct 2026 23:23:58 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:23:57 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:23 +0530
Subject: [PATCH v2 13/23] drm/msm/dcp: Route HFI display events
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-13-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=2412;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=BFTr4Q+ZfwwET6V0CyDqzPQcI8MwpqQ9e75s1Un7OM8=;
 b=SKN800pVbhcnvPWsUmrNznlIDbT64GT7gmpps6ZTh83CJvMF8drOdSRqgxsHIH2Rhkat9HE0L
 quOBQpd8NsHD9Z9IG6TzeX9xiSU8vrxzzp9OkSE6Nv19uQp+UAa/FHQ
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adef1ff cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dkYgh42podB0RqWQ9ZQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: DRAQ-r6fX84JoCbujsu08IzMI2JQma0Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX4JYoUnoIexsI
 zoncHX/wAlELbiLhcXJzQl1O+8KyyouykmMCbtXhheD+JUiGAW8P55MV4Y2hAKpb1cxsK6IKMXk
 wamKgUaE1MXy9/Ab84m6Qt3yTmP7Vmg=
X-Proofpoint-GUID: DRAQ-r6fX84JoCbujsu08IzMI2JQma0Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfXypL5EZVT0bps
 sxUiYlj/TPmPU36dEKfTgZxsrR/VheBIhypq6RZidnbpC/ftch5rc8gM6h7g6AzSEGECPk+eYdX
 r18YxH7mpitrzaOC2tRcA8CqiLSmdgciR0OKZpxgLvDsh4ygInnaHm2NiyV3Bc2P+zpgaHpwWFN
 ZL/ymbhqHUUj4K3B5ETDVOSuQlds3PxHGic1ucCkWWW1Spdts2zn01sqD2wHZ1Nsn6sKU3WxsoO
 y2RdU537BT/cRDRxuD3AuU8XV7SYU8GWsK6D30iXLzCjaqiRtQijiZVYwq53RuTBHkBziz2DHWJ
 g5L7rgONJIUisJTLLo9hAdtfBWekijeUKUrs5lOXh4IwDXTiOpbRzJbfK+QTbI2pAWZ0sEvqm8Q
 4v/K+fh6+ZDX/xj7WGrDH//7mtgCMjrcfwZohjhHZjEBpCb6D4Aq5HUSdH27aSPKTeOstqbbyd7
 vGxu+TXVXpqFpy/AgiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260025

Route asynchronous display events from DCP firmware into the DRM CRTC
objects. Without this mapping, VSYNC and frame-scan completion cannot
drive DRM vblank and page-flip completion.

Match firmware display events to the corresponding CRTC session and
deliver VSYNC and frame-scan completion notifications through the
MSM DRM callbacks.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dcp/dcp_hfi_core.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c b/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c
index 774a5afac0f0..e54ccfafdae0 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c
+++ b/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c
@@ -19,6 +19,7 @@
 #include "dcp_hfi.h"
 #include "dcp_hfi_priv.h"
 #include "dcp_drv.h"
+#include "dcp_crtc.h"
 #include "hfi/hfi_packet.h"
 #include "hfi/hfi_packer.h"
 #include "hfi/hfi_unpacker.h"
@@ -260,18 +261,35 @@ static void dcp_hfi_store_caps_payload(struct dcp_hfi *hfi,
 	dev_dbg(hfi->dev, "%s: stored %u bytes\n", name, n);
 }
 
+static void dcp_hfi_dispatch_frame_done(struct dcp_hfi *hfi,
+					const struct hfi_packet_info *pkt_info)
+{
+	const struct hfi_display_frame_event_data *frame = NULL;
+	u32 sequence_id = 0;
+
+	if (pkt_info->payload_ptr &&
+	    pkt_info->payload_size >= sizeof(*frame)) {
+		frame = pkt_info->payload_ptr;
+		sequence_id = frame->bufferflip_index;
+	}
+	dcp_crtc_hfi_frame_done_cb(hfi->drv, pkt_info->id & 0xFFFF,
+				   sequence_id);
+}
+
 /* Route asynchronous events and capability packets before flag handling. */
 static bool dcp_hfi_dispatch_event(struct dcp_hfi *hfi,
 				   const struct hfi_packet_info *pkt_info)
 {
 	switch (pkt_info->cmd) {
 	case HFI_COMMAND_DISPLAY_EVENT_VSYNC:
+		dcp_crtc_hfi_vblank_cb(hfi->drv, pkt_info->id & 0xFFFF);
 		return true;
 
 	case HFI_COMMAND_DISPLAY_EVENT_FRAME_SCAN_START:
 		return true;
 
 	case HFI_COMMAND_DISPLAY_EVENT_FRAME_SCAN_COMPLETE:
+		dcp_hfi_dispatch_frame_done(hfi, pkt_info);
 		return true;
 
 	case HFI_COMMAND_DISPLAY_EVENT_HPD_STATUS:
@@ -975,6 +993,9 @@ int dcp_hfi_init(struct dcp_drv *drv,
 	struct dcp_hfi *hfi;
 	int i, ret;
 
+	if (!dma_dev)
+		return -ENODEV;
+
 	hfi = devm_kzalloc(&vdev->dev, sizeof(*hfi), GFP_KERNEL);
 	if (!hfi)
 		return -ENOMEM;

-- 
2.43.0

