Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771A54FB9A5
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 13:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417281; cv=none; b=JLFtOw6SrzNrIkECedq2Es47rtru7QE4AhKNMExBFABwh8aKxQ1mOTa3fJ4qXN1CUoyvpWUcxduHodase4oZ3jqd7B0rNCQ63s2m9FrMha1iG2oQW2Dgj5zxIJZV5iaaGLEOaZIJbC0l6GwDzlqCIcAzbxYrkVAK4SC/CsPW3ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417281; c=relaxed/simple;
	bh=7CLjDKvCg1cE+GbFobTTlTezUdt4EGKsbKKkX8Uatv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iZ/tggqzkCqBHgOqYmpf8Hlf20w369rekGLApkIL8CbGX077g7n39tSLUi1aDhjBMUhFgRMVM+Omu0vlPY8jRxKXErcIcPQf4wCafkRf9ZiHgcsHMHI98pZTpHry7/Xd+PEItL17xMmaBsga7K/TLvhIu6QZ/S+P1ANXE7d3tnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bPLkH/Qj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CG6HgYK9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bPLkH/Qj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CG6HgYK9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OsIB1168036
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 13:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLtz8Q/TMU22DRhtoJORSpFlwLzi2GTdaeF9MO3FDcA=; b=bPLkH/Qj3qv/JkOd
	CsgFcLgEN19zHa6DuzhfPF5D1JOWHQdwHygyNaLgc21G8+s0/NJ+4V4NIUcZkwmo
	tjpUn4EgBacM9bWQ20TmCjdE4PL5u+BVmVtEjCiav1nq/NaBhDmF3SpTFOXbeu2d
	cefD8y2Em6QB5KxK/SjGBqXCRoSevHlajRWMO+eezfJBff0XElEA3Cj6otzfvi+O
	PFFRv92QGHH2IUZCc74dcK3zoBDii+VWZhNEQf1fE6sdyGmQulxshYWFcRurfXsa
	rpuHupVg7d8yZ3NiNVTA8T4z95b6CtYq/8pM7Vwm2fQx/erPodtS5gKYkYHWwLLA
	Mg+7Gg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c9b0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 13:41:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so743827785a.3
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 06:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417278; x=1793022078; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLtz8Q/TMU22DRhtoJORSpFlwLzi2GTdaeF9MO3FDcA=;
        b=CG6HgYK9TxoaOkzRxzL8w3CpPjINSJ4/Q/Orz4wPKU4GhZQVp+st6Uc97XppELhnxY
         tpFf9zJBZDtagweZ4ZVdDzqGrmNKspPEcnE1IRLwK97KoSOt87lj5hgRIMMHzdZmxTE2
         FYqdQHoUrKAITYPzUv5qggb/XzIrzDSqpTjXCOWNOFgNsWX76aKZQloBuwYyNlf/v7nX
         ucYbwtm7moGOMl2n0CcaBOzI6vockj8WNrJGUp2eU/6Vj4VzuLEL7e7KkAD1vGN6q9vC
         5t9V+xWBNIZHNED87uVIPgC4U0sE4OXgnXMuXoOiE8RBXhBlAAQV0D2toK2nNTLziMyc
         B0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417278; x=1793022078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WLtz8Q/TMU22DRhtoJORSpFlwLzi2GTdaeF9MO3FDcA=;
        b=DAwvUJDEy8iFa+Rch6uix/L7QZ2LMN1evJQeVq3xxVJ/jMGkK2xoSpFWJ3TS6HkmG0
         1KmAEuU6CMLncTxp1CHue4GUmtdSQXH3TYp6PwCdtcEPJpNPLrKlbiywuhbbiu/24YLp
         B59ifIdvsDhPfTtbi0cIazs+sYPuV1DvX9ikqaDcGVmlC/6+sushUy0TRYZyJXpyRWTj
         IaInG33ThbRBrceUtEU0tpWZB0JFSjL85kquBP7bcXms9tlGnENA/NDJhcOt1qN6+A+v
         uj2vhUf3hYC5GVH9TDrp6sFt1kIE7NjIGgNF6UjmM7Ta6Hza/z1peoc+xplTXE2rsdsz
         JW/w==
X-Forwarded-Encrypted: i=1; AKwUvByP2kQjGgC5qY+/qMYtrqr5OsDL2i0yGAkvdTEPoaM0RPaFnG0C4oa2eXvaGxN7tUb9zbKpC5veKkU9mA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIjEGNX62yBbPeR/A6ytBLlSRTzt6kWeIfJNXuFnzv5nivL2Wk4
	sXzwbal8o/+7scN9JvEYvAml/rUdau7WEnhsR/E0gXS2Goo5las/zYmK7Z9BudcaxgAgO9SldcK
	BzBJwLdvAy4BNvhHlZuVeEPp3BO5u2PX/5EC+MjT9hg8oPhxP4MGXkauvGu1wlPC8TQ==
X-Gm-Gg: AYBFou2ZyxKJhxRSWwv0vcuv2h6R8ppmFOjX15KZMjxMWk54iFTz7+pVXnbIIOjrxir
	aWF2p2f6bvuUynd56Oxbm2OxUEUHnS5Kx5Vvnf5z6OB6KhUmsTo/mK2+SrxgeJm2JHJ2FPXISQP
	AFvurDPhteHRJuoCTPVDls48ub11FPH3ss1ynCXP+Nhby8vx8r4iAkLXzRC7rYizt/QU96WRsxb
	PxYGl4+LaFi+uME4K+DNsHF2rGbXvfo5My4TGClnc/hnhv4HlbaXcrXnd9NQWeTx9yT+LTx1eaU
	kRSR5cULwxNDx8qNL4RYBFBg3b9s0gUeDpP6caiRqG3CQZuerSYUSdq6eaVrXxP9GpFR2f6y5Ja
	emw+TXZuSt1vfBwaBykWTknimKAaxS9HFnofKM38nNr9+Yvnjk+cESanG7VlktqOOyDCnXHgUdo
	c4vEivH77ADi0E
X-Received: by 2002:a05:620a:4091:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-93f29ba13aamr1365226085a.3.1792417277534;
        Mon, 19 Oct 2026 06:41:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4091:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-93f29ba13aamr1365221485a.3.1792417276980;
        Mon, 19 Oct 2026 06:41:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab473d06easm4409851fa.31.2026.10.19.06.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:41:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:41:03 +0300
Subject: [PATCH 04/10] clk: qcom: clk-rcg2: forward the gfx3d rate request
 to the parent
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-fix-clocks-v1-4-370949e4d8a0@oss.qualcomm.com>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2753;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7CLjDKvCg1cE+GbFobTTlTezUdt4EGKsbKKkX8Uatv8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1h3xV/SxvQX5OsnO/qBkwNtVW0h5q886zdtp/
 IXrM52S4BWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYd8QAKCRCLPIo+Aiko
 1crdCACnVe+Zpnz3lhiZe5G3is51pJa9bX21xOEwx2EvN6/1HVuFmsmunRac3ue9L/4RftAeQG2
 cDFS1JsbqW6+KY6SyOSAxZ2rpvaOdtWsz6xpiHfLho+9VwejZSvA8MWqjX1hYLU4nHkA15ZYohD
 F2Ftj8XX3P8SCb1HNXDTAV8BG47SuXQ1F+doQWipqgAOnVQ6H0Bmlci5J3iA9krKDn3Z3Y2nVJO
 6SisVFSwjsEkNe/MMW7GHszq744ZFbCnevAOIG860W5v78nGW/NxvsI22H6eN7PzWuWgbFiY+QG
 vTAwtvwhYz6EXGRRbOUuiuwQMMya4Rv0jwEKumGfaRkSpLZh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX1WlRxVOWq4+t
 It6VrNZCWBOvsnB+re+C0L3qBEj/AQiqVS9MkUseJHZlcgjYRTZwYCPln4O/Ixsth+4c6gHEBE4
 5TmdyIJ9s66VYdsNJAvw1PWlQbXkVck=
X-Proofpoint-ORIG-GUID: fcdFfePl36uGAaRHuMztUezPB9LqLwrz
X-Proofpoint-GUID: fcdFfePl36uGAaRHuMztUezPB9LqLwrz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX8VeYPxg2ijOI
 N24sAyrjN1cAGbdKV9OOUImtIjNDXEmA7EcB/upDnSoQ83HtGvWWUJ9FwHwmCjnWb5bXoQe0Oxb
 F4ltVPC6LO3ckkllLsUZPRrEHhgNWA0N6Z0qG8gZQ0EFgV3CHz9Ca1uERrWVCdZASyqRTSoBfY7
 P3XO8zO2Zr4LZdmMfwZ9u4GFK+xDNymA9YHJQFwGN0g5JBlez2DLWixAqR8F1dPfAZHW9Hu2Yi1
 EGsPtZendEZFdh8CEPjIIOCTHvMNyNMRw7CwRBJvEtWi2CUwmoGsRVgJhnCmCL+Vnk9pqcu0znp
 oAYRmaxvFym7LQvHsD+bxBRd/663pWk5ZxafdsV0R37yPLzCJEKfUSbFpTtyCHaQVVRTEgFxJRu
 2orD55jC9OFOhj5rZZBW1VlOTwK7SAU2hR8sKDTdZIQgyPbbRohJhpnvSR1n35/YWc9eKK3e5oB
 ThT2UHtGn/p3hisHtVw==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad61dfe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=R7Q5EYK7eyY8600vyYgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190054

GPU DVFS on SDM660 never changed the GFX3D rate. clk_gfx3d_determine_rate()
builds the parent request by hand and leaves best_parent_rate at zero, so
the PLL is asked to determine a rate for a zero parent rate and the new
rate is dropped on the floor.

Use clk_hw_forward_rate_request(), which fills in the parent's limits and
rate the way the core expects them.

Fixes: af1e62f2ffe2 ("clk: qcom: clk-rcg2: Take clock boundaries into consideration for gfx3d")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rcg2.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index c44c51d860e1..9e3d7e5c81e5 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1207,10 +1207,10 @@ EXPORT_SYMBOL_GPL(clk_pixel_ops);
 static int clk_gfx3d_determine_rate(struct clk_hw *hw,
 				    struct clk_rate_request *req)
 {
-	struct clk_rate_request parent_req = { .min_rate = 0, .max_rate = ULONG_MAX };
+	struct clk_rate_request parent_req;
 	struct clk_rcg2_gfx3d *cgfx = to_clk_rcg2_gfx3d(hw);
 	struct clk_hw *xo, *p0, *p1, *p2;
-	unsigned long p0_rate;
+	unsigned long p0_rate, parent_rate;
 	u8 mux_div = cgfx->div;
 	int ret;
 
@@ -1234,12 +1234,12 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
 	if (mux_div == 0)
 		mux_div = 1;
 
-	parent_req.rate = req->rate * mux_div;
+	parent_rate = req->rate * mux_div;
 
 	/* This has to be a fixed rate PLL */
 	p0_rate = clk_hw_get_rate(p0);
 
-	if (parent_req.rate == p0_rate) {
+	if (parent_rate == p0_rate) {
 		req->rate = req->best_parent_rate = p0_rate;
 		req->best_parent_hw = p0;
 		return 0;
@@ -1247,7 +1247,7 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
 
 	if (req->best_parent_hw == p0) {
 		/* Are we going back to a previously used rate? */
-		if (clk_hw_get_rate(p2) == parent_req.rate)
+		if (clk_hw_get_rate(p2) == parent_rate)
 			req->best_parent_hw = p2;
 		else
 			req->best_parent_hw = p1;
@@ -1257,16 +1257,9 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
 		req->best_parent_hw = p2;
 	}
 
-	clk_hw_get_rate_range(req->best_parent_hw,
-			      &parent_req.min_rate, &parent_req.max_rate);
+	clk_hw_forward_rate_request(hw, req, req->best_parent_hw, &parent_req,
+				    parent_rate);
 
-	if (req->min_rate > parent_req.min_rate)
-		parent_req.min_rate = req->min_rate;
-
-	if (req->max_rate < parent_req.max_rate)
-		parent_req.max_rate = req->max_rate;
-
-	parent_req.best_parent_hw = req->best_parent_hw;
 	ret = __clk_determine_rate(req->best_parent_hw, &parent_req);
 	if (ret)
 		return ret;

-- 
2.47.3

