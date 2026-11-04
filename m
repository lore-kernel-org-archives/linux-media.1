Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835962;
	b=AOFfkqMIHKUpfmb37rXGFIRolV8+/yqmn8AsWYn7gyOdVWTda3NsSKhFSxWkATcbhhE4
	 iyOdimNAwXxKFalTDr/KBAk68GtEcY6g7iEc3+x/QWQL0vmAsmkn7ZS4NO0RzaFyTgAzO
	 YVwD5/u0Ahc3HSz6eUYEwnVeUbBphq2ByNQIG5kDL4utxt6SWQXD2aowRzZnM/AMYWKeV
	 HJpOlk+0dJyNueMJQT6DPBpzENyo6kWN/vRAmbdxp9oh9/gh06097CC9x7EaSP9Vg2N0o
	 lrniNRBe6H7Jjp8u2AWZEetDV7rUBY43NngAFX7XcLNW1FTbSLYa7yi056XZWVpq0bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835962;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5iiuLumBEpUklHaQ5dUGicAl21u+KK+gUr9I9ovSmJk=;
	b=5NrxRPoh+eLZoy7eXTAZiaSVM4MZk5dH+XGl9y7jgz1QfGH9gChAD1dvgDymkoZ3TEYe
	 4isnQDXuxZ9NjGA9DbI6Bc36keh43hYlXfhgVcbSSOm7eLAhTZvkWYC2Z9YM7QfK2vI5U
	 MEBCtI6h/yuMEgptMdj7B/hhf/LhUP6pkHlp35bFWPPs/a2qZiw3v45E1Jm6vj65wA5RD
	 UCikqYWXDXkE9xczAq+QUxO6VS2NVvfrvsTOnsb7A2sJsGjQUf5ytxcCW7p+4xiCCetwd
	 f7M5d80KcqSQw9QyYzFp8SOrhmw5nfDFIqG6Oc7lmp/AMsbmwRYhJcRMmJhU+Klqpyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A+yFEjE1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4B1606A326;
	Wed,  4 Nov 2026 23:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A+yFEjE1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BDF1F000C1;
	Wed,  4 Nov 2026 23:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793835961;
	bh=5iiuLumBEpUklHaQ5dUGicAl21u+KK+gUr9I9ovSmJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A+yFEjE14WlS9JIFy2ruxYZ1ZFEPcPKyNPzu7xzxG51GihicNgUrg+RX0LDRYze1C
	 F4U8pHw6JeOh+KQGanJrpX3yveQTLO9acp1ZaypKihoOXupn1HNOiyJMH9sqRrBHg0
	 h+rP7eFC6lLmkwqAbfq2jNchz/JzEc2KHBCyrkCmBrzRyTaGEwiU1ZJwRvOUR9XP0H
	 ptmOBu2l4JX1qh5qloE7HdG8S89v1P4/9gU9c5TJw6odyzvLfvyEuKZ3SykBFpGO66
	 qMxoB2XGY8WvwjTVFpZFlM/CZAj6iVzNjbY+XQ3L9Y64TR6Ov01qe4PfvSw6/ftzTF
	 k/UXlNh4flJMg==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/4] media: qcom: camss: Select Titan 480 CSID offset by VFE type
Date: Thu,  5 Nov 2026 01:45:31 +0200
Message-ID: <20261104234533.3044265-3-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261104234533.3044265-1-vz@kernel.org>
References: <20261104234533.3044265-1-vz@kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Titan 480 CSID register spaces are placed inside VFE register spaces,
and the offset of CSID registers differs between VFE and VFE lite blocks.

Instead of the assumption that all VFEs starting from the third one are
VFE lite blocks, check the VFE type in the platform VFE resources.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index a00791b00feb..9e64e8d44926 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1119,7 +1119,7 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 		 * between the VFE "top" and "bus" registers. this requires
 		 * VFE to be initialized before CSID
 		 */
-		if (id >= 2) /* VFE/CSID lite */
+		if (camss->res->vfe_res[id].vfe.is_lite)
 			csid->base = csid->res->parent_dev_ops->get_base_address(camss, id)
 				+ VFE_480_LITE_CSID_OFFSET;
 		else
-- 
2.51.0

