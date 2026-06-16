Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413C13890F7;
	Tue, 16 Jun 2026 14:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781620587; cv=none; b=lllqe/tw+6iADR0bnXctRnMgNg814KRwDt4KaOjfGVwce3zZ8t6NhSLqV2CsUxkxM6IafYXK5Ci3kQjJSRweOMkG/OxT6l3vo46YXsQhoOESTFueUOs44OgS1v0aE91heDQZcQCuK1zENWYT36cc4CjO1JS+MB0SGQE4ULa87qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781620587; c=relaxed/simple;
	bh=LdGNgffAvFJAW4HBWJMCisiUfrq+97pnPm38Ijdbqyg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C82wHkyrrmKHnAP9KeUOBs40JVBal728fFk7vkVma0h9QoGlqj9pBb99wr40URZsUlxH8Yiq2QI9IxZysxb1SYwOxW81Rkvb12DYQqH/Aa7/VkThhFpfrQnMH24tpiwF0mZQzKQAT598dbYUI+kZTnA8kkU0NDMh0oKo/AbwZso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fcJFne5i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fcJFne5i"
Received: from [192.168.1.107] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F4382EC;
	Tue, 16 Jun 2026 16:35:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781620551;
	bh=LdGNgffAvFJAW4HBWJMCisiUfrq+97pnPm38Ijdbqyg=;
	h=From:Subject:Date:To:Cc:From;
	b=fcJFne5iCoiHAxOjefnQbA4z1Q0x9NWhOaLbjCxlFeIii60EZ62xPDOBxtbu3vIrn
	 /sVlLVOif0PUQ+WLqZVpPgNsrYzYBMLxx+RYiRpVtboAKPvNet7nBg5J9WTbj2w1yf
	 FDuc5BKquliV1Mxbu9PFcryHBz45UCbNeEWt06j8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v2 0/2] media: mali-c55: Add support for CCM and Gamma
Date: Tue, 16 Jun 2026 16:36:15 +0200
Message-Id: <20260616-mali-c55-ccm-gamma-v2-0-0f93e9a95d98@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF9fMWoC/32NUQrCMBBEr1L225Uk2mr98h7SjzXZtAumkUSKU
 nJ3Yw8gDANvYGZWyJyEM1yaFRIvkiXOFcyuATvRPDKKqwxGmU51usNAD0HbtmhtwJFCILTKkHK
 +7X1/hlp8Jvby3kZvQ+VJ8iumz/ax6F/6d27RqFCfjp6rHNPhKtVznO+RktvbGGAopXwBTvMpn
 LsAAAA=
X-Change-ID: 20260616-mali-c55-ccm-gamma-c02a0df59f98
To: Nayden.Kanchev@arm.com, Konstantin Babin <Konstantin.Babin@arm.com>, 
 Anthony McGivern <anthony.mcgivern@arm.com>, vincenzo.frascino@arm.com, 
 linus.walleij@arm.com, Daniel Scally <dan.scally@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=LdGNgffAvFJAW4HBWJMCisiUfrq+97pnPm38Ijdbqyg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqMV9meH8TaW4lEkbADPZcgQm5gbM25VkiAitz7
 ZcJ9UNRvV2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCajFfZgAKCRByNAaPFqFW
 PJvCEACopSUdA5L3KDTHWcvVrQVcu6XjJTjau5Su5wjK3NM/EoQjlINg0UnmSA8dysii2dw8P59
 k1Xj+Tl+nbRe5JVn8Ga7j8/IEl14G1z+IiKvfIxKjuwApANOWeacKPqSBiQCbLdGRiP0yictmGK
 TMMDY+genI4vwA5ffQrU33ZEQII2AZEYBBSSN4kafsIegzyBA8xNuxTpkwAH2VNIBa/BeFzTW14
 saiDcrW1/7cZCHCUvoYcRNJEQf3x192ihdYxlPNxaSTIW3N8oSmEe3QX5QxC/IzVnLOe895+Ci3
 FoOUePbeBM6BpuexTPwszkrsA4pNDl3v4GGwv/WjxuRvbEpca5v/daHodbyzQX/X8Bpx05/6s06
 fyZDI3OUxLMFNhqjK36/Z902Eg+qhp8BseruoowG6qJ3+IgXwkYzph021Xjo20Ic+O903DrSs64
 xRm7bxdxLJRLzF55CKtQm6klF5bTPZSxwcGyvpvuJUekSldWKJOGp9aL6J8P3yCsZhLZ/5nlat5
 KljbMRhet6vy0OAgBaw0yQ+APrs9pyRMWzvj2zCzQk6onsDcjgEmrGFrUMpDPCxZkRpfU3mlbeG
 hzvA/OE0xs0jE3ybBdjLCalqucUMRLkS3XIsZ4jOZCmwcRd29Nmfdyor4xcFmjWJ+6RqU07KePH
 X6Mt6ExBzLtFY9Q==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add support for Ccm and Gamma to the Mali-C55 ISP by defining the
corresponding blocks in the uAPI and implementing their handling in
the driver.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20260616-mali-c55-ccm-gamma-v1-0-174fe4fedea3@ideasonboard.com

---
Jacopo Mondi (2):
      media: arm: mali-c55: Add support for CCM
      media: arm: mali-c55: Add support for RGB Gamma

 .../media/platform/arm/mali-c55/mali-c55-params.c  | 127 +++++++++++++++++++++
 .../platform/arm/mali-c55/mali-c55-registers.h     |   5 +
 include/uapi/linux/media/arm/mali-c55-config.h     |  84 +++++++++++++-
 3 files changed, 215 insertions(+), 1 deletion(-)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20260616-mali-c55-ccm-gamma-c02a0df59f98

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>

