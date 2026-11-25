Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577115;
	b=bmwuk4Exg3sdFG/mtT3nfE5t0YmaJ3xH+6MT5GzOIQrbpuwkCwwXqTOAVKtBpFph/3yy
	 57mmHYf3dSLlaiIuDlyRN8OL1nnuOelP0KDJwozUG82XibEhAKUJRb0THYNvGQU5tXVtU
	 k308UnIU/pDbD7GqOra/7SQ1rYPjHdopj7gUNxmHAezqYapcXJ1soO1tDTdnPKB1rsaHI
	 oLpTqeV5wSMxiJtm1ymLs0lFNqFjJoG4Hv2S83/EP3ZaqAYb+N5P+1pI9ejZ7YocRZHmd
	 aScy8i8k13fJ/lhLLHVxH5ct96GUDNypBzER601cjFKZwxLtss9ntNn6jIzQs3hbk1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577115;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qHgCPp0k1WnFfoOQ3+jYbQkxDR6qFsiCsmEtypgCdr8=;
	b=j2ihaNKdI+xeZO5UcjgcxLUMz60cBDjgBlviM8Zr1yRxFo5OcgCSlqPuxEXYX2J1QKSn
	 ysdjU9Pba/5ujH7JD8pAibwtzDo56q6Osq1Ve57fal99kAmrwc0JlT3OFirXPD59OItbE
	 tViES8Njj+vLDPeNnefMhCZ+TvXDLrzACSz7etSmbMZYckt0IvhWoq96KnY6f81YaX1Ki
	 p0wiuKpwVqKB4YXggfXPUaERoQgFUIHhIfps75JIu/0OZvBKWhevMeNlRsAT1n4g6F2iJ
	 XY/DvecS/NoEzL6Pg/DW/0V3dc2aukHOMMa3/OXykUJjkpQJV1yKb0h29uYZl0qebZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iJA8LuXi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="aP/SzOg/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5190606A680
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5190606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iJA8LuXi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aP/SzOg/
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2AsSb2109318
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qHgCPp0k1WnFfoOQ3+jYbQkxDR6qFsiCsmEtypgCdr8=; b=iJA8LuXiX01nLkcN
	Qt2xWg/PQ2BnY4QDfIDR9y6HjYvCNprGIm1XdOOOuxEZf8HIE4iHm8TOHqJRfIGz
	8BeGYilXdiXmpyAhRTj9h4qfk+f4Y77B2xEPj73RIJsnk+qh+ihZfdCf7GxtTsbz
	lwdvvDCvGej0vAFOXSQ88T6GN0lKXqzxVfC2OGim7N8mEvmUW2VHXNjjHAj3onEt
	jedZypwKhHa/AfpkGAuTx531PloMQ/U0AM7QnhsktH+AQ+FHSn1tYoLM1keFiGF9
	knfcPoYU8kvarLKhzPuKSQkxnkF3Hh1DjMn0UnRCYToUT3wAVOpb4ByM1WEGBfEo
	euSUQQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eyd9yv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:25:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so4007857b3a.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 19:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795577112; x=1796181912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHgCPp0k1WnFfoOQ3+jYbQkxDR6qFsiCsmEtypgCdr8=;
        b=aP/SzOg/aoCKadCXskMdNNGqRb8QKOXWu9YG2zwT9Fb5UOkB3UoSHXDKwPmcsAJXLz
         avc9ayejuc5wGAczvS1ZtNDXwSAOUE69CnhVIufPBbMwkvxxrL8XnUeFchw4Nz3xAP3f
         eChaJaCsmcZ3obV3fWz/WptdNUiTU5Cz1IZeqiJY5GBk4t2b42loPSyc/QtvRm0BU4Tk
         uzOvsK9P/KJS4Fe2b8bmnITCVwdy91exyugV9g+ZeExZ8yXZN3g6VV88bdy9o8Iwph/0
         iT0ifT0PzeT/qqj7aLQzUR7OZJR9PVjbMwJOp/EqxDSYdo2negFTiWI1SQSEwJaQPZII
         24qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577112; x=1796181912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHgCPp0k1WnFfoOQ3+jYbQkxDR6qFsiCsmEtypgCdr8=;
        b=NvueGgBkgm0rPxtHNHD6BW7A4fuVbwJ895cTvndfejTwBD3QmntTB7TnHE7wrHlOdA
         mkJgmb5b1s7ZAl45LoFskdflXKi+Nhou4J7tikTw7TF/pcT6pwzFrmdTpYVX6XzeHuKv
         qSA1JavgZDHH2sg8d10jXcVutv25boOa2eU36uJ9HlUD6zse/A9ZBtG+FDYDOuJ4XKnz
         JjXXAV71jlcfiX7vq7gMhzybAEQKZcyLFKSbXnwsuxFjv3AO4thdkRMNkVzTSldSnFgi
         a9HMOZqjsZ8sDIMfBgMAo2VN3q6jL7f5r1chXyXrpF06Q9xGvPqpf/EhaP34fzckxfQq
         gYpw==
X-Forwarded-Encrypted: i=1; AL+hErH9ir6TCt5TEHwpcm4qtu+W02GBogPtvSCq8g32ne3CYvxv3gi/+GWoNv4EuLRJ+gTvVPlGAkTyvs6Sew==@vger.kernel.org
X-Gm-Message-State: APuU4Z/9glGup+psnefOPMFyEE3znbXHpZShA/BhTz16FImptdFrZ1+X
	l1iRl/SUqaVT7bhdMvc3abclf2p/0LNVOMlISnpYI47d0jvrH1mWk9zSetKCI1CUBSVH2TGPGD3
	8TkIwnSjnK+9eSmnZT++G8GFiMk9Qkuf1yLMtRwt315aoxVgC10XX/CAQQHG+vn0+6g==
X-Gm-Gg: AZFdTZcKL4CQH9E2mXbviHjOcxzz3xc5V0S3fIqwWDJEETyoz0nrcB5Ea1C2Zt2MMkm
	8v+YTBs0edo7/MJzpi0ppzbu4bgXZPY++02iysNWtHjziQigpaeOpL+Mirq1lfkZbntLfh+0rFz
	zFKh+pWTpx/iQsT0EKWzNAbHyJcBRFZxyBgp7AG5Rdgg++I1p2bTCJa2htv7K9uktlEzU9/yUEh
	pWwUAB88G3TVYJdDuQwv4Vd5aORDaKioY62EH0gcnmFBdeCGYKGZkrHnm0h5GdiEdQlrQzagt3o
	2qT4F5i8axTt3EW2Q55F78UDCGX6WpDggumGpz5DQ2VccGu24XZqLfrTv6GtCaydDSW55TYKDIz
	fIh7ScWFfUA6QiNEb6BXdwGCXDFx4wz2/zYyp+CPithZANDbM+QZ9/i+wYJw2GBwMg0I0239pEU
	rV8v3gKw8=
X-Received: by 2002:a05:6a00:4b03:b0:89e:3ff1:920d with SMTP id d2e1a72fcca58-8c87d01fba2mr14512343b3a.45.1795577111638;
        Tue, 24 Nov 2026 19:25:11 -0800 (PST)
X-Received: by 2002:a05:6a00:4b03:b0:89e:3ff1:920d with SMTP id d2e1a72fcca58-8c87d01fba2mr14512315b3a.45.1795577110948;
        Tue, 24 Nov 2026 19:25:10 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm4762399b3a.25.2026.11.24.19.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:25:10 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 08:54:10 +0530
Subject: [PATCH v12 3/9] media: iris: Replace enum-indexed clock and power
 domain tables with per-block structures
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
Message-Id: <20261125-glymur-v12-3-5c34dfd73fc2@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795577086; l=50506;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=c28ORJ67eEGXgrdt6NfqGmpCRn3almQQgSEob597/Ck=;
 b=O2z6gkjTYGGqDMMOPbD+l4fx3KsrsaAzn6q/k3U96FZ5FMyq+29C3ltirET1HJIKUvxAQsaNa
 +f9xZl5n8oZB+QCf/GCYMJsOvSOXCf0CUYtgZ6l+dzFslJ8dggbrUKH
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX/tcNr8tWxvhc
 uEj5hWUqRFuCeB3IWF+b0lyH4DVIM8ZlXCH4sGSsLS48cZDx7v1SUaX+p521mjYjuCh6WRdfz68
 Mpfc9I8vgFIsWohNVkWQRSqVkneDgnI=
X-Proofpoint-ORIG-GUID: minTe293x39k8We0GK0_g6jreuWNBW20
X-Proofpoint-GUID: minTe293x39k8We0GK0_g6jreuWNBW20
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b065518 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=AfHJXyeNWO_Ybgju4nYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX0Zi41wZ0RPfL
 O0dhgN7Lk9S4td868jrWOeik+p1HUw+F1X3oMXGoCupuZFZx8ewW+p1MAlFC+SYjdBJK81vhgm9
 twQ4ZpB2omE/pabfGbEYmd9oULNbn42HqMBCWNMbU9jH5mptN9kZMpmRnRrxA87rx71uucQXZhW
 tgHaGvBfWPzpmc4d1+/NgrXV/V5ya2RJEwuJziIy3uvSFLbKyuhx1xBgY+wmaCjNgzNOSpTcWbx
 k+sIZ9uvL+W1Fy8GPcThQD0ixVwLPzwaHUqpX7ztbXWARKru6If4ETf2n59qsxYYQN7NmT2HNFY
 CVmAAeVGmD2aRfexCll6Kuk2hgZbiMtCJaZy8tujFkHAQ3AlnuPhksyzI5Km0Dv2jJZCa1I01qx
 envBiXDeqWMXBitGV9knAaLeoxcvw6zBIv5+ZNKJwonI1xTXD4CEx2T6CXPMbEHmFfcGdrhSUtc
 rMxINOBEobTTM/XAbXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250013

As new platforms are added, the platform_clk_type and
platform_pm_domain_type enums keep growing. Every new clock or
power domain requires a new enum entry, and every enable/disable
path has to loop through the clock table to find the right clock
by enum value, adding overhead and boilerplate on each path.
The enum index space is also shared across all hardware blocks.
On the Glymur platform, the VPP0 index for VPU4x and the VCODEC1
index clash, making it error-prone to extend support without
breaking existing platforms.
Replace the flat tables and enum-based lookups with
iris_power_domain, which bundles a power domain device and its
associated clocks together per hardware block. Platform data
describes each block via iris_power_domain_data, and the enable
and disable helpers operate directly on an iris_power_domain
instance, removing the need for any index lookup at runtime.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h       |  23 +++-
 .../platform/qcom/iris/iris_platform_common.h      |  42 ++-----
 .../platform/qcom/iris/iris_platform_sc7280.h      |  28 ++++-
 .../platform/qcom/iris/iris_platform_sm8250.h      |  26 +++-
 .../platform/qcom/iris/iris_platform_sm8550.h      |  26 +++-
 .../platform/qcom/iris/iris_platform_sm8750.h      |  29 +++--
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  20 +--
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  32 ++---
 .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  |  37 ++++--
 .../platform/qcom/iris/iris_platform_x1p42100.h    |  27 +++-
 drivers/media/platform/qcom/iris/iris_probe.c      | 137 +++++++++++++++++++--
 drivers/media/platform/qcom/iris/iris_resources.c  |  81 ++++++------
 drivers/media/platform/qcom/iris/iris_resources.h  |   8 +-
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  37 +-----
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 137 +++------------------
 drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c |  70 +----------
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  98 ++-------------
 17 files changed, 376 insertions(+), 482 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index f5b0a9440b3a9..7c2dc24f2060a 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -17,6 +17,13 @@
 #include "iris_resources.h"
 #include "iris_state.h"
 
+struct iris_power_domain {
+	struct device		**dev;
+	unsigned int		pd_cnt;
+	struct clk_bulk_data	*clocks;
+	unsigned int		clk_cnt;
+};
+
 struct icc_info {
 	const char		*name;
 	u32			bw_min_kbps;
@@ -55,10 +62,12 @@ struct qcom_ubwc_cfg_data;
  * @iris_vb2_ops: iris vb2 ops
  * @icc_tbl: table of iris interconnects
  * @icc_count: count of iris interconnects
- * @pmdomain_tbl: table of iris power domains
+ * @ctrl: power domain and clocks for the controller
+ * @vcodec: power domain and clocks for the vcodec
+ * @vcodec_vpp0: power domain and clocks for the vcodec VPP0
+ * @vcodec_vpp1: power domain and clocks for the vcodec VPP1
+ * @apv: power domain and clocks for the APV hardware block
  * @opp_pmdomain_tbl: table of opp power domains
- * @clock_tbl: table of iris clocks
- * @clk_count: count of iris clocks
  * @resets: table of iris reset clocks
  * @controller_resets: table of controller reset clocks
  * @iris_platform_data: a structure for platform data
@@ -107,10 +116,12 @@ struct iris_core {
 	const struct vb2_ops			*iris_vb2_ops;
 	struct icc_bulk_data			*icc_tbl;
 	u32					icc_count;
-	struct dev_pm_domain_list		*pmdomain_tbl;
+	struct iris_power_domain		*ctrl;
+	struct iris_power_domain		*vcodec;
+	struct iris_power_domain		*vcodec_vpp0;
+	struct iris_power_domain		*vcodec_vpp1;
+	struct iris_power_domain		*apv;
 	struct dev_pm_domain_list		*opp_pmdomain_tbl;
-	struct clk_bulk_data			*clock_tbl;
-	u32					clk_count;
 	struct reset_control_bulk_data		*resets;
 	struct reset_control_bulk_data		*controller_resets;
 	const struct iris_platform_data		*iris_platform_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index cddab9a9c375a..49a3dcec7546d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -72,27 +72,6 @@ extern const struct iris_platform_data sm8650_data;
 extern const struct iris_platform_data sm8750_data;
 extern const struct iris_platform_data x1p42100_data;
 
-enum platform_clk_type {
-	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
-	IRIS_CTRL_CLK,
-	IRIS_AHB_CLK,
-	IRIS_HW_CLK,
-	IRIS_HW_AHB_CLK,
-	IRIS_AXI1_CLK,
-	IRIS_CTRL_FREERUN_CLK,
-	IRIS_HW_FREERUN_CLK,
-	IRIS_BSE_HW_CLK,
-	IRIS_VPP0_HW_CLK,
-	IRIS_VPP1_HW_CLK,
-	IRIS_APV_HW_CLK,
-	IRIS_THROTTLE_CLK,
-};
-
-struct platform_clk_data {
-	enum platform_clk_type clk_type;
-	const char *clk_name;
-};
-
 struct tz_cp_config {
 	u32 cp_start;
 	u32 cp_size;
@@ -256,12 +235,11 @@ struct icc_vote_data {
 	u32 fps;
 };
 
-enum platform_pm_domain_type {
-	IRIS_CTRL_POWER_DOMAIN,
-	IRIS_HW_POWER_DOMAIN,
-	IRIS_VPP0_HW_POWER_DOMAIN,
-	IRIS_VPP1_HW_POWER_DOMAIN,
-	IRIS_APV_HW_POWER_DOMAIN,
+struct iris_power_domain_data {
+	const char * const *pd_names;
+	unsigned int pd_cnt;
+	const char * const *clk_names;
+	unsigned int clk_cnt;
 };
 
 struct iris_firmware_data {
@@ -327,13 +305,14 @@ struct iris_platform_data {
 	unsigned int icc_tbl_size;
 	const struct bw_info *bw_tbl_dec;
 	unsigned int bw_tbl_dec_size;
-	const char * const *pmdomain_tbl;
-	unsigned int pmdomain_tbl_size;
+	const struct iris_power_domain_data *ctrl_data;
+	const struct iris_power_domain_data *vcodec_data;
+	const struct iris_power_domain_data *vcodec_vpp0_data;
+	const struct iris_power_domain_data *vcodec_vpp1_data;
+	const struct iris_power_domain_data *apv_data;
 	const char * const *opp_pd_tbl;
 	unsigned int opp_pd_tbl_size;
-	const struct platform_clk_data *clk_tbl;
 	const char * const *opp_clk_tbl;
-	unsigned int clk_tbl_size;
 	const char * const *clk_rst_tbl;
 	unsigned int clk_rst_tbl_size;
 	const char * const *controller_rst_tbl;
@@ -351,6 +330,7 @@ struct iris_platform_data {
 	u32 wd_intr_mask;
 	u32 icc_ib_multiplier;
 	u32 max_session_count;
+	u32 num_cores;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
 	/* max number of macroblocks per second supported */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
index 0ec8f334df670..26a21f42e14f9 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
@@ -15,12 +15,28 @@ static const struct bw_info sc7280_bw_table_dec[] = {
 
 static const char * const sc7280_opp_pd_table[] = { "cx" };
 
-static const struct platform_clk_data sc7280_clk_table[] = {
-	{IRIS_CTRL_CLK,    "core"         },
-	{IRIS_AXI_CLK,     "iface"        },
-	{IRIS_AHB_CLK,     "bus"          },
-	{IRIS_HW_CLK,      "vcodec_core"  },
-	{IRIS_HW_AHB_CLK,  "vcodec_bus"   },
+static const struct iris_power_domain_data iris_ctrl_sc7280 = {
+	.pd_names = (const char *[]) {
+		"venus",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"iface", "core", "bus",
+	},
+	.clk_cnt = 3,
+};
+
+static const struct iris_power_domain_data iris_vcodec_sc7280[] = {
+	{
+		.pd_names = (const char *[]) {
+			"vcodec0",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"vcodec_core", "vcodec_bus",
+		},
+		.clk_cnt = 2,
+	},
 };
 
 static const char * const sc7280_opp_clk_table[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.h b/drivers/media/platform/qcom/iris/iris_platform_sm8250.h
index 50306043eb8ec..cdbd50ea787a7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.h
@@ -15,10 +15,28 @@ static const struct bw_info sm8250_bw_table_dec[] = {
 
 static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
 
-static const struct platform_clk_data sm8250_clk_table[] = {
-	{IRIS_AXI_CLK,  "iface"        },
-	{IRIS_CTRL_CLK, "core"         },
-	{IRIS_HW_CLK,   "vcodec0_core" },
+static const struct iris_power_domain_data iris_ctrl_sm8250 = {
+	.pd_names = (const char *[]) {
+		"venus",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"iface", "core",
+	},
+	.clk_cnt = 2,
+};
+
+static const struct iris_power_domain_data iris_vcodec_sm8250[] = {
+	{
+		.pd_names = (const char *[]) {
+			"vcodec0",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"vcodec0_core",
+		},
+		.clk_cnt = 1,
+	},
 };
 
 static const char * const sm8250_opp_clk_table[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
index 3c9dae995bb24..498dc0bd9fc5b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
@@ -8,10 +8,28 @@
 
 static const char * const sm8550_clk_reset_table[] = { "bus" };
 
-static const struct platform_clk_data sm8550_clk_table[] = {
-	{IRIS_AXI_CLK,  "iface"        },
-	{IRIS_CTRL_CLK, "core"         },
-	{IRIS_HW_CLK,   "vcodec0_core" },
+static const struct iris_power_domain_data iris_ctrl_sm8550 = {
+	.pd_names = (const char *[]) {
+		"venus",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"iface", "core",
+	},
+	.clk_cnt = 2,
+};
+
+static const struct iris_power_domain_data iris_vcodec_sm8550[] = {
+	{
+		.pd_names = (const char *[]) {
+			"vcodec0",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"vcodec0_core",
+		},
+		.clk_cnt = 1,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8750.h b/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
index 719056656a5ba..2f99b7fe02418 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
@@ -10,13 +10,28 @@ static const char * const sm8750_clk_reset_table[] = {
 	"bus0", "bus1", "core", "vcodec0_core"
 };
 
-static const struct platform_clk_data sm8750_clk_table[] = {
-	{IRIS_AXI_CLK,		"iface"			},
-	{IRIS_CTRL_CLK,		"core"			},
-	{IRIS_HW_CLK,		"vcodec0_core"		},
-	{IRIS_AXI1_CLK,		"iface1"		},
-	{IRIS_CTRL_FREERUN_CLK,	"core_freerun"		},
-	{IRIS_HW_FREERUN_CLK,	"vcodec0_core_freerun"	},
+static const struct iris_power_domain_data iris_ctrl_sm8750 = {
+	.pd_names = (const char *[]) {
+		"venus",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"iface1", "core_freerun", "core",
+	},
+	.clk_cnt = 3,
+};
+
+static const struct iris_power_domain_data iris_vcodec_sm8750[] = {
+	{
+		.pd_names = (const char *[]) {
+			"vcodec0",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"iface", "vcodec0_core_freerun", "vcodec0_core",
+		},
+		.clk_cnt = 3,
+	},
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index becbe37765449..cefb423834c27 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -68,8 +68,6 @@ static const struct icc_info iris_icc_info_vpu2[] = {
 
 static const char * const iris_clk_reset_table_vpu2[] = { "bus", "core" };
 
-static const char * const iris_pmdomain_table_vpu2[] = { "venus", "vcodec0" };
-
 static const struct tz_cp_config tz_cp_config_vpu2[] = {
 	{
 		.cp_start = 0,
@@ -86,12 +84,10 @@ const struct iris_platform_data milos_data = {
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_milos),
 	.bw_tbl_dec = sm8250_bw_table_dec,
 	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
-	.pmdomain_tbl = iris_pmdomain_table_vpu2,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu2),
+	.ctrl_data = &iris_ctrl_sm8250,
+	.vcodec_data = iris_vcodec_sm8250,
 	.opp_pd_tbl = milos_opp_pd_table,
 	.opp_pd_tbl_size = ARRAY_SIZE(milos_opp_pd_table),
-	.clk_tbl = sm8250_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
 	.opp_clk_tbl = sm8250_opp_clk_table,
 	.clk_rst_tbl = iris_clk_reset_table_vpu2,
 	.clk_rst_tbl_size = ARRAY_SIZE(iris_clk_reset_table_vpu2),
@@ -115,12 +111,10 @@ const struct iris_platform_data sc7280_data = {
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
 	.bw_tbl_dec = sc7280_bw_table_dec,
 	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
-	.pmdomain_tbl = iris_pmdomain_table_vpu2,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu2),
+	.ctrl_data = &iris_ctrl_sc7280,
+	.vcodec_data = iris_vcodec_sc7280,
 	.opp_pd_tbl = sc7280_opp_pd_table,
 	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
-	.clk_tbl = sc7280_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(sc7280_clk_table),
 	.opp_clk_tbl = sc7280_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
@@ -149,12 +143,10 @@ const struct iris_platform_data sm8250_data = {
 	.clk_rst_tbl_size = ARRAY_SIZE(iris_clk_reset_table_vpu2),
 	.bw_tbl_dec = sm8250_bw_table_dec,
 	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
-	.pmdomain_tbl = iris_pmdomain_table_vpu2,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu2),
+	.ctrl_data = &iris_ctrl_sm8250,
+	.vcodec_data = iris_vcodec_sm8250,
 	.opp_pd_tbl = sm8250_opp_pd_table,
 	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
-	.clk_tbl = sm8250_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
 	.opp_clk_tbl = sm8250_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index e963cb116313f..bcda31a5b8f5b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -69,8 +69,6 @@ static const struct bw_info iris_bw_table_dec_vpu3x[] = {
 	{ ((1920 * 1080) / 256) * 30,  294000 },
 };
 
-static const char * const iris_pmdomain_table_vpu3x[] = { "venus", "vcodec0" };
-
 static const char * const iris_opp_pd_table_vpu3x[] = { "mxc", "mmcx" };
 
 static const char * const iris_opp_clk_table_vpu3x[] = {
@@ -100,12 +98,10 @@ const struct iris_platform_data qcs8300_data = {
 	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
 	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
 	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
-	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.ctrl_data = &iris_ctrl_sm8550,
+	.vcodec_data = iris_vcodec_sm8550,
 	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
 	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
-	.clk_tbl = sm8550_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
@@ -132,12 +128,10 @@ const struct iris_platform_data sm8550_data = {
 	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
 	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
 	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
-	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.ctrl_data = &iris_ctrl_sm8550,
+	.vcodec_data = iris_vcodec_sm8550,
 	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
 	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
-	.clk_tbl = sm8550_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
@@ -172,12 +166,10 @@ const struct iris_platform_data sm8650_data = {
 	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
 	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
 	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
-	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.ctrl_data = &iris_ctrl_sm8550,
+	.vcodec_data = iris_vcodec_sm8550,
 	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
 	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
-	.clk_tbl = sm8550_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
@@ -204,12 +196,10 @@ const struct iris_platform_data sm8750_data = {
 	.clk_rst_tbl_size = ARRAY_SIZE(sm8750_clk_reset_table),
 	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
 	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
-	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.ctrl_data = &iris_ctrl_sm8750,
+	.vcodec_data = iris_vcodec_sm8750,
 	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
 	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
-	.clk_tbl = sm8750_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(sm8750_clk_table),
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
@@ -242,12 +232,10 @@ const struct iris_platform_data x1p42100_data = {
 	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
 	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
 	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
-	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.ctrl_data = &iris_ctrl_x1p42100,
+	.vcodec_data = iris_vcodec_x1p42100,
 	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
 	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
-	.clk_tbl = x1p42100_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(x1p42100_clk_table),
 	.opp_clk_tbl = x1p42100_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
index 43460b82ae77a..b0d13a8b3d90f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
@@ -43,17 +43,30 @@ static const struct icc_info iris_icc_info_ar50lt[] = {
 	{ "video-mem",  1000, 6500000  },
 };
 
-static const char * const iris_pmdomain_table_ar50lt[] = { "venus", "vcodec0" };
-
 static const char * const iris_opp_pd_table_ar50lt[] = { "cx" };
 
-static const struct platform_clk_data iris_clk_table_ar50lt[] = {
-	{IRIS_CTRL_CLK,    "core"         },
-	{IRIS_AXI_CLK,     "iface"        },
-	{IRIS_AHB_CLK,     "bus"          },
-	{IRIS_HW_CLK,      "vcodec0_core" },
-	{IRIS_HW_AHB_CLK,  "vcodec0_bus"  },
-	{IRIS_THROTTLE_CLK, "throttle"    },
+static const struct iris_power_domain_data iris_ctrl_ar50lt = {
+	.pd_names = (const char *[]) {
+		"venus",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"core", "iface", "bus",
+	},
+	.clk_cnt = 3,
+};
+
+static const struct iris_power_domain_data iris_vcodec_ar50lt[] = {
+	{
+		.pd_names = (const char *[]) {
+			"vcodec0",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"vcodec0_core", "vcodec0_bus", "throttle",
+		},
+		.clk_cnt = 3,
+	},
 };
 
 static const char * const iris_opp_clk_table_ar50lt[] = {
@@ -91,12 +104,10 @@ const struct iris_platform_data qcm2290_data = {
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_ar50lt),
 	.bw_tbl_dec = iris_bw_table_dec_ar50lt,
 	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_ar50lt),
-	.pmdomain_tbl = iris_pmdomain_table_ar50lt,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_ar50lt),
+	.ctrl_data = &iris_ctrl_ar50lt,
+	.vcodec_data = iris_vcodec_ar50lt,
 	.opp_pd_tbl = iris_opp_pd_table_ar50lt,
 	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_ar50lt),
-	.clk_tbl = iris_clk_table_ar50lt,
-	.clk_tbl_size = ARRAY_SIZE(iris_clk_table_ar50lt),
 	.opp_clk_tbl = iris_opp_clk_table_ar50lt,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h b/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
index d89acfbc1233d..faea381f62adc 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
@@ -6,11 +6,28 @@
 #ifndef __IRIS_PLATFORM_X1P42100_H__
 #define __IRIS_PLATFORM_X1P42100_H__
 
-static const struct platform_clk_data x1p42100_clk_table[] = {
-	{IRIS_AXI_CLK,		"iface"			},
-	{IRIS_CTRL_CLK,		"core"			},
-	{IRIS_HW_CLK,		"vcodec0_core"		},
-	{IRIS_BSE_HW_CLK,	"vcodec0_bse"		},
+static const struct iris_power_domain_data iris_ctrl_x1p42100 = {
+	.pd_names = (const char *[]) {
+		"venus",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"iface", "core",
+	},
+	.clk_cnt = 2,
+};
+
+static const struct iris_power_domain_data iris_vcodec_x1p42100[] = {
+	{
+		.pd_names = (const char *[]) {
+			"vcodec0",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"vcodec0_core", "vcodec0_bse",
+		},
+		.clk_cnt = 2,
+	},
 };
 
 static const char *const x1p42100_opp_clk_table[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index c239e1a6a4658..37401365192a6 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -41,15 +41,45 @@ static int iris_init_icc(struct iris_core *core)
 	return devm_of_icc_bulk_get(core->dev, core->icc_count, core->icc_tbl);
 }
 
-static int iris_init_power_domains(struct iris_core *core)
+static int iris_init_power_domains_per_block(struct iris_core *core,
+					     struct iris_power_domain *pd,
+					     const struct iris_power_domain_data *pd_data)
 {
-	int ret;
+	struct dev_pm_domain_attach_data iris_pd_data = {};
+	struct dev_pm_domain_list *pmdomain_tbl;
+	int ret, i;
 
-	struct dev_pm_domain_attach_data iris_pd_data = {
-		.pd_names = core->iris_platform_data->pmdomain_tbl,
-		.num_pd_names = core->iris_platform_data->pmdomain_tbl_size,
-		.pd_flags = PD_FLAG_NO_DEV_LINK,
-	};
+	if (!pd_data->pd_cnt)
+		return -EINVAL;
+
+	iris_pd_data.pd_names = pd_data->pd_names;
+	iris_pd_data.num_pd_names = pd_data->pd_cnt;
+	iris_pd_data.pd_flags = PD_FLAG_NO_DEV_LINK;
+
+	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &pmdomain_tbl);
+	if (ret <= 0)
+		return ret ?: -EINVAL;
+
+	pd->pd_cnt = pmdomain_tbl->num_pds;
+
+	if (pd->pd_cnt != pd_data->pd_cnt)
+		return -EINVAL;
+
+	pd->dev = devm_kzalloc(core->dev, pd->pd_cnt * sizeof(*pd->dev), GFP_KERNEL);
+	if (!pd->dev)
+		return -ENOMEM;
+
+	for (i = 0; i < pd->pd_cnt; i++)
+		pd->dev[i] = pmdomain_tbl->pd_devs[i];
+
+	return 0;
+}
+
+static int iris_init_power_domains(struct iris_core *core)
+{
+	const struct iris_platform_data *plat = core->iris_platform_data;
+	unsigned int num_cores = max(plat->num_cores, 1);
+	int i, ret;
 
 	struct dev_pm_domain_attach_data iris_opp_pd_data = {
 		.pd_names = core->iris_platform_data->opp_pd_tbl,
@@ -62,10 +92,57 @@ static int iris_init_power_domains(struct iris_core *core)
 		.config_clks = dev_pm_opp_config_clks_simple,
 	};
 
-	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &core->pmdomain_tbl);
-	if (ret < 0)
+	core->ctrl = devm_kzalloc(core->dev, sizeof(*core->ctrl), GFP_KERNEL);
+	if (!core->ctrl)
+		return -ENOMEM;
+
+	ret = iris_init_power_domains_per_block(core, core->ctrl, plat->ctrl_data);
+	if (ret)
 		return ret;
 
+	core->vcodec = devm_kzalloc(core->dev, num_cores * sizeof(*core->vcodec), GFP_KERNEL);
+	if (!core->vcodec)
+		return -ENOMEM;
+
+	for (i = 0; i < num_cores; i++) {
+		ret = iris_init_power_domains_per_block(core, &core->vcodec[i],
+							&plat->vcodec_data[i]);
+		if (ret)
+			return ret;
+	}
+
+	if (plat->vcodec_vpp0_data) {
+		core->vcodec_vpp0 = devm_kzalloc(core->dev, sizeof(*core->vcodec_vpp0), GFP_KERNEL);
+		if (!core->vcodec_vpp0)
+			return -ENOMEM;
+
+		ret = iris_init_power_domains_per_block(core, core->vcodec_vpp0,
+							plat->vcodec_vpp0_data);
+		if (ret)
+			return ret;
+	}
+
+	if (plat->vcodec_vpp1_data) {
+		core->vcodec_vpp1 = devm_kzalloc(core->dev, sizeof(*core->vcodec_vpp1), GFP_KERNEL);
+		if (!core->vcodec_vpp1)
+			return -ENOMEM;
+
+		ret = iris_init_power_domains_per_block(core, core->vcodec_vpp1,
+							plat->vcodec_vpp1_data);
+		if (ret)
+			return ret;
+	}
+
+	if (plat->apv_data) {
+		core->apv = devm_kzalloc(core->dev, sizeof(*core->apv), GFP_KERNEL);
+		if (!core->apv)
+			return -ENOMEM;
+
+		ret = iris_init_power_domains_per_block(core, core->apv, plat->apv_data);
+		if (ret)
+			return ret;
+	}
+
 	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
 	/* backwards compatibility for incomplete ABI SM8250 */
 	if (ret == -ENODEV &&
@@ -84,17 +161,51 @@ static int iris_init_power_domains(struct iris_core *core)
 	return devm_pm_opp_of_add_table(core->dev);
 }
 
+static int iris_init_clocks_per_block(struct iris_core *core, struct iris_power_domain *pd,
+				      const struct iris_power_domain_data *pd_data)
+{
+	unsigned int i;
+
+	if (!pd_data)
+		return 0;
+
+	pd->clk_cnt = pd_data->clk_cnt;
+	pd->clocks = devm_kcalloc(core->dev, pd->clk_cnt, sizeof(*pd->clocks), GFP_KERNEL);
+	if (!pd->clocks)
+		return -ENOMEM;
+
+	for (i = 0; i < pd->clk_cnt; i++)
+		pd->clocks[i].id = pd_data->clk_names[i];
+
+	return devm_clk_bulk_get(core->dev, pd->clk_cnt, pd->clocks);
+}
+
 static int iris_init_clocks(struct iris_core *core)
 {
+	const struct iris_platform_data *plat = core->iris_platform_data;
+	unsigned int num_cores = max(plat->num_cores, 1);
+	unsigned int i;
 	int ret;
 
-	ret = devm_clk_bulk_get_all(core->dev, &core->clock_tbl);
-	if (ret < 0)
+	ret = iris_init_clocks_per_block(core, core->ctrl, plat->ctrl_data);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < num_cores; i++) {
+		ret = iris_init_clocks_per_block(core, &core->vcodec[i], &plat->vcodec_data[i]);
+		if (ret)
+			return ret;
+	}
+
+	ret = iris_init_clocks_per_block(core, core->vcodec_vpp0, plat->vcodec_vpp0_data);
+	if (ret)
 		return ret;
 
-	core->clk_count = ret;
+	ret = iris_init_clocks_per_block(core, core->vcodec_vpp1, plat->vcodec_vpp1_data);
+	if (ret)
+		return ret;
 
-	return 0;
+	return iris_init_clocks_per_block(core, core->apv, plat->apv_data);
 }
 
 static int iris_init_reset_table(struct iris_core *core,
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 6a87f8eecdd1f..d6123e4a41b03 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -9,7 +9,6 @@
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
-#include <linux/reset.h>
 
 #include "iris_core.h"
 #include "iris_instance.h"
@@ -73,73 +72,63 @@ int iris_opp_set_rate(struct device *dev, unsigned long freq)
 	return dev_pm_opp_set_opp(dev, opp);
 }
 
-int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
+int iris_enable_power_domain_and_clocks(struct iris_core *core, struct iris_power_domain *pd)
 {
-	int ret;
+	int ret, i;
 
 	ret = iris_opp_set_rate(core->dev, ULONG_MAX);
 	if (ret)
 		return ret;
 
-	return pm_runtime_resume_and_get(pd_dev);
-}
+	for (i = 0; i < pd->pd_cnt; i++) {
+		ret = pm_runtime_resume_and_get(pd->dev[i]);
+		if (ret < 0)
+			goto error;
+	}
 
-int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
-{
-	int ret;
-	int pm_ret;
+	ret = clk_bulk_prepare_enable(pd->clk_cnt, pd->clocks);
+	if (ret)
+		goto error;
 
-	ret = iris_opp_set_rate(core->dev, 0);
+	return 0;
 
-	pm_ret = pm_runtime_put_sync(pd_dev);
-	if (!ret)
-		ret = pm_ret;
+error:
+	iris_opp_set_rate(core->dev, 0);
 
-	return ret;
-}
+	while (--i >= 0)
+		pm_runtime_put_sync(pd->dev[i]);
 
-static struct clk *iris_get_clk_by_type(struct iris_core *core, enum platform_clk_type clk_type)
-{
-	const struct platform_clk_data *clk_tbl;
-	u32 clk_cnt, i, j;
-
-	clk_tbl = core->iris_platform_data->clk_tbl;
-	clk_cnt = core->iris_platform_data->clk_tbl_size;
-
-	for (i = 0; i < clk_cnt; i++) {
-		if (clk_tbl[i].clk_type == clk_type) {
-			for (j = 0; core->clock_tbl && j < core->clk_count; j++) {
-				if (!strcmp(core->clock_tbl[j].id, clk_tbl[i].clk_name))
-					return core->clock_tbl[j].clk;
-			}
-		}
-	}
-
-	return NULL;
+	return ret;
 }
 
-int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type)
+void iris_disable_power_domain_and_clocks(struct iris_core *core, struct iris_power_domain *pd)
 {
-	struct clk *clock;
+	int i;
 
-	clock = iris_get_clk_by_type(core, clk_type);
-	if (!clock)
-		return -ENOENT;
+	iris_opp_set_rate(core->dev, 0);
+	clk_bulk_disable_unprepare(pd->clk_cnt, pd->clocks);
 
-	return clk_prepare_enable(clock);
+	for (i = 0; i < pd->pd_cnt; i++)
+		pm_runtime_put_sync(pd->dev[i]);
 }
 
-int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type)
+int iris_genpd_set_hwmode(struct iris_power_domain *pd, bool mode)
 {
-	struct clk *clock;
-
-	clock = iris_get_clk_by_type(core, clk_type);
-	if (!clock)
-		return -EINVAL;
+	int i, ret;
 
-	clk_disable_unprepare(clock);
+	for (i = 0; i < pd->pd_cnt; i++) {
+		ret = dev_pm_genpd_set_hwmode(pd->dev[i], mode);
+		if (ret)
+			goto error;
+	}
 
 	return 0;
+
+error:
+	while (--i >= 0)
+		dev_pm_genpd_set_hwmode(pd->dev[i], !mode);
+
+	return ret;
 }
 
 struct device *iris_get_cb_dev(struct iris_inst *inst, enum iris_buffer_type buffer_type)
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
index a9a5bddb19c24..3e9116d05d558 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.h
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -7,14 +7,14 @@
 #define __IRIS_RESOURCES_H__
 
 struct iris_core;
+struct iris_power_domain;
 
 int iris_opp_set_rate(struct device *dev, unsigned long freq);
-int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev);
-int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev);
 int iris_unset_icc_bw(struct iris_core *core);
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
-int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
-int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
+int iris_enable_power_domain_and_clocks(struct iris_core *core, struct iris_power_domain *pd);
+void iris_disable_power_domain_and_clocks(struct iris_core *core, struct iris_power_domain *pd);
+int iris_genpd_set_hwmode(struct iris_power_domain *pd, bool mode);
 struct device *iris_get_cb_dev(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index c3b760730c981..e1822b0ba4baf 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -205,53 +205,20 @@ static int iris_vpu33_power_off_controller(struct iris_core *core)
 	val &= ~NOC_HALT;
 	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
 
-	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
-
 disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_power_domain_and_clocks(core, core->ctrl);
 
 	return 0;
 }
 
 static int iris_vpu35_power_on_hw(struct iris_core *core)
 {
-	int ret;
-
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
-	if (ret)
-		return ret;
-
-	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
-	if (ret)
-		goto err_disable_power;
-
-	ret = iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
-	if (ret)
-		goto err_disable_axi_clk;
-
-	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
-	if (ret)
-		goto err_disable_hw_free_clk;
-
-	return 0;
-
-err_disable_hw_free_clk:
-	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
-err_disable_axi_clk:
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
-err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
-
-	return ret;
+	return iris_enable_power_domain_and_clocks(core, core->vcodec);
 }
 
 static void iris_vpu35_power_off_hw(struct iris_core *core)
 {
 	iris_vpu33_power_off_hardware(core);
-
-	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
 }
 
 const struct vpu_ops iris_vpu3_ops = {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 90ccdc0d2a076..9d89d3f00acf7 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -27,27 +27,24 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
 {
 	int ret;
 
-	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], hw_mode);
+	ret = iris_genpd_set_hwmode(core->vcodec, hw_mode);
 	if (ret)
 		return ret;
 
 	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
-		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
-					      [IRIS_VPP0_HW_POWER_DOMAIN], hw_mode);
+		ret = iris_genpd_set_hwmode(core->vcodec_vpp0, hw_mode);
 		if (ret)
 			goto restore_hw_domain_mode;
 	}
 
 	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
-		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
-					      [IRIS_VPP1_HW_POWER_DOMAIN], hw_mode);
+		ret = iris_genpd_set_hwmode(core->vcodec_vpp1, hw_mode);
 		if (ret)
 			goto restore_vpp0_domain_mode;
 	}
 
 	if (!(efuse_value & DISABLE_VIDEO_APV_BIT)) {
-		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
-					      [IRIS_APV_HW_POWER_DOMAIN], hw_mode);
+		ret = iris_genpd_set_hwmode(core->apv, hw_mode);
 		if (ret)
 			goto restore_vpp1_domain_mode;
 	}
@@ -56,37 +53,19 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
 
 restore_vpp1_domain_mode:
 	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
-		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VPP1_HW_POWER_DOMAIN],
-					!hw_mode);
+		iris_genpd_set_hwmode(core->vcodec_vpp1, !hw_mode);
 restore_vpp0_domain_mode:
 	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
-		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VPP0_HW_POWER_DOMAIN],
-					!hw_mode);
+		iris_genpd_set_hwmode(core->vcodec_vpp0, !hw_mode);
 restore_hw_domain_mode:
-	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], !hw_mode);
+	iris_genpd_set_hwmode(core->vcodec, !hw_mode);
 
 	return ret;
 }
 
 static int iris_vpu4x_power_on_apv(struct iris_core *core)
 {
-	int ret;
-
-	ret = iris_enable_power_domains(core,
-					core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
-	if (ret)
-		return ret;
-
-	ret = iris_prepare_enable_clock(core, IRIS_APV_HW_CLK);
-	if (ret)
-		goto disable_apv_hw_power_domain;
-
-	return 0;
-
-disable_apv_hw_power_domain:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
-
-	return ret;
+	return iris_enable_power_domain_and_clocks(core, core->apv);
 }
 
 static void iris_vpu4x_power_off_apv(struct iris_core *core)
@@ -138,8 +117,7 @@ static void iris_vpu4x_power_off_apv(struct iris_core *core)
 	writel(0x0, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
 
 disable_clocks_and_power:
-	iris_disable_unprepare_clock(core, IRIS_APV_HW_CLK);
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
+	iris_disable_power_domain_and_clocks(core, core->apv);
 }
 
 static void iris_vpu4x_ahb_sync_reset_apv(struct iris_core *core)
@@ -158,116 +136,43 @@ static void iris_vpu4x_ahb_sync_reset_hardware(struct iris_core *core)
 	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
 }
 
-static int iris_vpu4x_enable_hardware_clocks(struct iris_core *core, u32 efuse_value)
-{
-	int ret;
-
-	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
-	if (ret)
-		return ret;
-
-	ret = iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
-	if (ret)
-		goto disable_axi_clock;
-
-	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
-	if (ret)
-		goto disable_hw_free_run_clock;
-
-	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
-	if (ret)
-		goto disable_hw_clock;
-
-	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
-		ret = iris_prepare_enable_clock(core, IRIS_VPP0_HW_CLK);
-		if (ret)
-			goto disable_bse_hw_clock;
-	}
-
-	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
-		ret = iris_prepare_enable_clock(core, IRIS_VPP1_HW_CLK);
-		if (ret)
-			goto disable_vpp0_hw_clock;
-	}
-
-	return 0;
-
-disable_vpp0_hw_clock:
-	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
-		iris_disable_unprepare_clock(core, IRIS_VPP0_HW_CLK);
-disable_bse_hw_clock:
-	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
-disable_hw_clock:
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
-disable_hw_free_run_clock:
-	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
-disable_axi_clock:
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
-
-	return ret;
-}
-
-static void iris_vpu4x_disable_hardware_clocks(struct iris_core *core, u32 efuse_value)
-{
-	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
-		iris_disable_unprepare_clock(core, IRIS_VPP1_HW_CLK);
-
-	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
-		iris_disable_unprepare_clock(core, IRIS_VPP0_HW_CLK);
-
-	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
-	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
-}
-
 static int iris_vpu4x_power_on_hardware(struct iris_core *core)
 {
 	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
 	int ret;
 
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	ret = iris_enable_power_domain_and_clocks(core, core->vcodec);
 	if (ret)
 		return ret;
 
 	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
-		ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
-						[IRIS_VPP0_HW_POWER_DOMAIN]);
+		ret = iris_enable_power_domain_and_clocks(core, core->vcodec_vpp0);
 		if (ret)
 			goto disable_hw_power_domain;
 	}
 
 	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
-		ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
-						[IRIS_VPP1_HW_POWER_DOMAIN]);
+		ret = iris_enable_power_domain_and_clocks(core, core->vcodec_vpp1);
 		if (ret)
 			goto disable_vpp0_power_domain;
 	}
 
-	ret = iris_vpu4x_enable_hardware_clocks(core, efuse_value);
-	if (ret)
-		goto disable_vpp1_power_domain;
-
 	if (!(efuse_value & DISABLE_VIDEO_APV_BIT)) {
 		ret = iris_vpu4x_power_on_apv(core);
 		if (ret)
-			goto disable_hw_clocks;
+			goto disable_vpp1_power_domain;
 	}
 
 	return 0;
 
-disable_hw_clocks:
-	iris_vpu4x_disable_hardware_clocks(core, efuse_value);
 disable_vpp1_power_domain:
 	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
-		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
-						[IRIS_VPP1_HW_POWER_DOMAIN]);
+		iris_disable_power_domain_and_clocks(core, core->vcodec_vpp1);
 disable_vpp0_power_domain:
 	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
-		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
-						[IRIS_VPP0_HW_POWER_DOMAIN]);
+		iris_disable_power_domain_and_clocks(core, core->vcodec_vpp0);
 disable_hw_power_domain:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_power_domain_and_clocks(core, core->vcodec);
 
 	return ret;
 }
@@ -335,17 +240,13 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
 	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
 
 disable_clocks_and_power:
-	iris_vpu4x_disable_hardware_clocks(core, efuse_value);
-
 	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
-		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
-					   [IRIS_VPP1_HW_POWER_DOMAIN]);
+		iris_disable_power_domain_and_clocks(core, core->vcodec_vpp1);
 
 	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
-		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
-					   [IRIS_VPP0_HW_POWER_DOMAIN]);
+		iris_disable_power_domain_and_clocks(core, core->vcodec_vpp0);
 
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_power_domain_and_clocks(core, core->vcodec);
 }
 
 static int iris_vpu4x_set_hwmode(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
index e084a5b49f2e3..80be443d56a42 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
@@ -36,85 +36,25 @@ static void iris_vpu_ar50lt_disable_arp(struct iris_core *core)
 
 static int iris_vpu_ar50lt_power_off_controller(struct iris_core *core)
 {
-	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
-	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	iris_disable_power_domain_and_clocks(core, core->ctrl);
 
 	return 0;
 }
 
 static void iris_vpu_ar50lt_power_off_hw(struct iris_core *core)
 {
-	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
-	iris_disable_unprepare_clock(core, IRIS_THROTTLE_CLK);
-	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_genpd_set_hwmode(core->vcodec, false);
+	iris_disable_power_domain_and_clocks(core, core->vcodec);
 }
 
 static int iris_vpu_ar50lt_power_on_controller(struct iris_core *core)
 {
-	int ret;
-
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
-	if (ret)
-		return ret;
-
-	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
-	if (ret)
-		goto err_disable_power;
-
-	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
-	if (ret && ret != -ENOENT)
-		goto err_disable_ctrl_clock;
-
-	ret = iris_prepare_enable_clock(core, IRIS_AHB_CLK);
-	if (ret)
-		goto err_disable_axi_clock;
-
-	return 0;
-
-err_disable_axi_clock:
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
-err_disable_ctrl_clock:
-	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
-err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
-
-	return ret;
+	return iris_enable_power_domain_and_clocks(core, core->ctrl);
 }
 
 static int iris_vpu_ar50lt_power_on_hw(struct iris_core *core)
 {
-	int ret;
-
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
-	if (ret)
-		return ret;
-
-	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
-	if (ret)
-		goto err_disable_power;
-
-	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
-	if (ret)
-		goto err_disable_hw_clock;
-
-	ret = iris_prepare_enable_clock(core, IRIS_THROTTLE_CLK);
-	if (ret)
-		goto err_disable_hw_ahb_clock;
-
-	return 0;
-
-err_disable_hw_ahb_clock:
-	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
-err_disable_hw_clock:
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
-err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
-
-	return ret;
+	return iris_enable_power_domain_and_clocks(core, core->vcodec);
 }
 
 const struct vpu_ops iris_vpu_ar50lt_ops = {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 243bd845349fe..4ea7bfd204df0 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -215,21 +215,15 @@ int iris_vpu_power_off_controller(struct iris_core *core)
 	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
 
 disable_power:
-	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
-	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	iris_disable_power_domain_and_clocks(core, core->ctrl);
 
 	return 0;
 }
 
 void iris_vpu_power_off_hw(struct iris_core *core)
 {
-	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
-	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
-	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_genpd_set_hwmode(core->vcodec, false);
+	iris_disable_power_domain_and_clocks(core, core->vcodec);
 }
 
 void iris_vpu_power_off(struct iris_core *core)
@@ -248,7 +242,7 @@ int iris_vpu_power_on_controller(struct iris_core *core)
 	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
 	int ret;
 
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	ret = iris_enable_power_domain_and_clocks(core, core->ctrl);
 	if (ret)
 		return ret;
 
@@ -256,60 +250,17 @@ int iris_vpu_power_on_controller(struct iris_core *core)
 	if (ret)
 		goto err_disable_power;
 
-	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
-	if (ret)
-		goto err_disable_power;
-
-	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
-	if (ret)
-		goto err_disable_axi_clock;
-
-	ret = iris_prepare_enable_clock(core, IRIS_AHB_CLK);
-	if (ret && ret != -ENOENT)
-		goto err_disable_ctrl_clock;
-
 	return 0;
 
-err_disable_ctrl_clock:
-	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
-err_disable_axi_clock:
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
 err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	iris_disable_power_domain_and_clocks(core, core->ctrl);
 
 	return ret;
 }
 
 int iris_vpu_power_on_hw(struct iris_core *core)
 {
-	int ret;
-
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
-	if (ret)
-		return ret;
-
-	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
-	if (ret)
-		goto err_disable_power;
-
-	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
-	if (ret && ret != -ENOENT)
-		goto err_disable_hw_clock;
-
-	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
-	if (ret && ret != -ENOENT)
-		goto err_disable_hw_ahb_clock;
-
-	return 0;
-
-err_disable_hw_ahb_clock:
-	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
-err_disable_hw_clock:
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
-err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
-
-	return ret;
+	return iris_enable_power_domain_and_clocks(core, core->vcodec);
 }
 
 int iris_vpu_set_hwmode(struct iris_core *core)
@@ -319,7 +270,7 @@ int iris_vpu_set_hwmode(struct iris_core *core)
 	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
 	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
 
-	return dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
+	return iris_genpd_set_hwmode(core->vcodec, true);
 }
 
 int iris_vpu_switch_to_hwmode(struct iris_core *core)
@@ -380,11 +331,7 @@ int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
 			   val, val == 0, 200, 2000);
 
 disable_power:
-	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
-	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
-	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
-
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	iris_disable_power_domain_and_clocks(core, core->ctrl);
 
 	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
 
@@ -393,34 +340,7 @@ int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
 
 int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
 {
-	int ret;
-
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
-	if (ret)
-		return ret;
-
-	ret = iris_prepare_enable_clock(core, IRIS_AXI1_CLK);
-	if (ret)
-		goto err_disable_power;
-
-	ret = iris_prepare_enable_clock(core, IRIS_CTRL_FREERUN_CLK);
-	if (ret)
-		goto err_disable_axi1_clk;
-
-	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
-	if (ret)
-		goto err_disable_ctrl_free_clk;
-
-	return 0;
-
-err_disable_ctrl_free_clk:
-	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
-err_disable_axi1_clk:
-	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
-err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
-
-	return ret;
+	return iris_enable_power_domain_and_clocks(core, core->ctrl);
 }
 
 void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core)

-- 
2.34.1

