Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223163FFF8E
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 06:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661647; cv=none; b=GmKyiHyLqbagf1THMSmEfZmqBz/AeFLHWKjTImBWDgfnIFC6YJUsSbUO7cAqIwi/2EMWiL6a/ekl43tcGmrgoTpEb5mg/9ZtNJ9P2S19zDKIUscb7PnXCwzMjeMvlZ588ww4rZp73XoFjfFTofi8IYbOug3zXNgs4a89LFPpTG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661647; c=relaxed/simple;
	bh=G3am0/a/Ijj4U5pm2yL6WwsTqv72Q+O6M5TIZ7omO9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nqFj+7pukWgua2u2J17WnrEX06LOndQpqvhEXHzKt/noRoFKhVbr/hTj1xG53J6r/A3IOxvZyPFrOAaCgX26Dv7rRd2JjhngBCThZBwxPRzh/4XOyQsryargrWZGIjhf8bbKuqR/VheXnOcwvP8yFO0OIE/3mXSnM+623u+D4K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q9UZRBES; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJq1VUSX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q9UZRBES";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJq1VUSX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47iIv4052976
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 06:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TSSINV+dZj2OXNz4UWPYAT4M/ULxuq0D3kY0/YhDsUQ=; b=Q9UZRBESwxa427iV
	zYcF16rx3BgqMFpAnE0UZgIdCn8gHcyGim2mxeXkEl5VNuCju6pwR7QWN/eekE4Q
	4xhPF9K5O+4OKZmoh1340bjY1oQRrvex1FHGq3fg+Od2t/uHOXTWLxhIzVxeNSgX
	2jID+6PV1tBxFaFUu25A36J+jepeio8Jfn+1W2XzD/J5Jn8i25RLHo+lGTsKpqrg
	MzGO8CE2Vk88/GpLm/y0BBwgJtDS6+OxNTicv7L1/uS+MseGQEiRrUnVtsf/LwwF
	ghNWk1h8QQFgXLenKshoMo2nkq/uyFd42n3GOY+2dZ2utxSU3CQBougBqS86sil9
	UShzJQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxgcby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 06:00:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b6416441eso6782506a91.1
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 23:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790661643; x=1791266443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSSINV+dZj2OXNz4UWPYAT4M/ULxuq0D3kY0/YhDsUQ=;
        b=OJq1VUSX22gsT5/HBu+fS891iGNbOchRKfE7tDCWnbBmAaEm45FIjA8329/jZfTwvM
         MtEOLpZIBHa4gmdWxx8rYbFKmf6NxvxNARbr818TOFe1P76ev5ftCW3tRO7nbNDzczYm
         QcknSO88ZnLldmUkcZooIbhylFSFpj12aTUeu906hsnAjOGcCB/ZTdBmY3QnoX5VZQmU
         2KTklE7FVDMbz+uMo/DoQKBN58Izkx7pIZmTo6Sl3RqZhps0bUZr+tcys0zhwOUierrR
         3Jbr0OW1U/bbq20bPCBe1OzwfCe3w2YFdRACFAs9wYitu4SozjZWsylIojzW9Rv+hEbl
         eXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790661643; x=1791266443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSSINV+dZj2OXNz4UWPYAT4M/ULxuq0D3kY0/YhDsUQ=;
        b=P+CAoJYxPn1T2hujjbW46IUKpaOijW2u7YRO5lsLXyioJUc9n7oTpa8IO47o/riKwZ
         vIhMVM352z0BPT6WrLiaJbeySrSxZI9MCQ1d1LBI1GHtaGqyEP4F5jvWGEGXjh7m8SJo
         KMjP3U/5WJXSQaL0bcKdizaanNzI2FtpSb7y2XG50zCDGUB1ItIqdQOvQytz+ZbA5Ot6
         AP2O5TMADVyrA/EWkKE5dV6bgFDa/t03KXM+wSYP0KeW0JCLDRJLv6UaYXF5I63gym42
         hIAr+awTkEtCrgC5kwKxeIgXXMLIIKqkMeB9kk5XC87VgHfD4e4rISlkvbWtPVi+VkRj
         SoKA==
X-Forwarded-Encrypted: i=1; AKwUvBxDOuEPIT4dxCulSMXWpmeZ7SyjZkRZ7YL5t75C6eAeZ+dX9oPWTi1yKVyKfRLsh+ub0q6x4MMbOP/ukg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK/X7eUvkm4HgwdTbEufmTj0bRG72Q0j18BW9gqFGKEzlJKeH+a
	DTRJZbRdqtgfclsoic/eiwTzblUa8ouUyfHDNZKCA6pgQg200rey3HppDI6J/P0uwy7XPg53Viz
	XNpULf+DSLnTptKPcBDlHYoVEZvWnnljEg3l98m4vKDAbxAeATy8Wav/8zJkX3i8uQQ==
X-Gm-Gg: AYBFou0A90wWYR1vTrDHQglyp4NFHyZGg8wRfLlS9HLOK9kPaiFjr9v4EtsDCKHQkoP
	8S5NhrSYIFWOGVQi2oe6mP+uaeYzeO3TOo8FU3P95Gbz80pN+unCmDRD2wL4fDuT58FZNAhkClt
	IRSC+IaDgWW6aaYPzMtd6vouFQYja7sc9A99uiXB08X7Xb5CAA/+foEAsRcNipEUYr3jSos4k/E
	Gd4gksjg7b8CrLTNjk4b0bNlvPTu0juodn6NvCT/Ye9sqYEJpbAfGV01r/PlVYHYI/igrApVlpX
	4ZUYLbcpxSv9b7GfarOdEgVFh3H9maZm7ERnHSothpK5JjwhbxnacUNU5F8AWHS4FRmaClHB8Bo
	7crGiMEXM4risGia6pEdX7gugPUOBf+ASAmQ3mGNQTmk8uXhMz0ARTXrHY0aeQsUG7DoUUSfhF3
	g7x1LHYFbQUw==
X-Received: by 2002:a17:90a:e7ce:b0:3a0:2662:815a with SMTP id 98e67ed59e1d1-3a098db8c10mr14573806a91.43.1790661642656;
        Mon, 28 Sep 2026 23:00:42 -0700 (PDT)
X-Received: by 2002:a17:90a:e7ce:b0:3a0:2662:815a with SMTP id 98e67ed59e1d1-3a098db8c10mr14573757a91.43.1790661642186;
        Mon, 28 Sep 2026 23:00:42 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985ff0f2sm3383588a91.8.2026.09.28.23.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:00:41 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 23:00:27 -0700
Subject: [PATCH v17 01/11] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-kaanapali-camss-v17-1-dcf3fd37f76c@oss.qualcomm.com>
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
In-Reply-To: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfX6ZkHt2WEGvoB
 QtKzRtkCWKnq+m9toUSqTq0jxUe90CSa4WD3ts2zerXaFopfqaiVcJdx54h2zxaZ/kEZvcWz0Eu
 4ANip0xMLbhKO8KxAA42KzVxBFSce34=
X-Proofpoint-GUID: XG57ZxwCdma-f5dGCRZCHr-JlSGIpQUm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfX7dC9rI+avrzS
 Wk2tFWuN5Crg/5mTR4D7Qzmh361KZEFoL8pY906FTLFPR8K9nKqTBUyPJdNZRof1UkLg5uxjqOL
 XI7YnbHST5bS4E/GoC2JkW9td8Rk93VO4ug0z4ydT2x78qPNRFAchMERR149Yw0sGmUyn3QxlOL
 E5vKQBUfIAh5HeuUDAy1ikdKO50lO/d+3C9N/6zkY7xFlglbB8qu4DWTrqqIIC8igCPHf7KYiOo
 5iHhsg517ujVTW5CzTZJ8WyBKLTp/VglsnkfuiXUXb1kly98WAiG5enutMp7wE8aw5kBLcAv63B
 gZzp0T1nMhha58FcjesqJekd1FZwPq5Tz9lW01bdN5JSuvmK0Jah1DkySRyq9RnNofYfqQFAeCS
 RI8tDgO/NCBvs7Esmmd4Z29pnJMom+QYoE0fa0vT5Ahd/WTJTwLe3UsZGZp7hZfqWJ66yc4VQf1
 nmHpdLxqXn9PrfHqkiA==
X-Proofpoint-ORIG-GUID: XG57ZxwCdma-f5dGCRZCHr-JlSGIpQUm
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abb540b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8sc_bQFcTW-iTt5i-CEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290023

The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index dc64af97da6c..24ca06b97656 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,x1e80100-csi2-phy
+    enum:
+      - qcom,kaanapali-csi2-phy
+      - qcom,x1e80100-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

