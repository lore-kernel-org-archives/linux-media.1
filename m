Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7035138886D;
	Sat, 27 Jun 2026 14:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782570586; cv=none; b=WouejFMucDSn/n7dm5UBRZJWKXRNse1WIbQWnFgH+znHl9VotWsQH+SciLa+x3bQb45HW2GOxbdFGvSmj/R1zKdZ+S4At8mJwhoNcaMx7lHNvYh7FADQOcdfqNBsyOuxDcTK0kmBtSmUHacV9FPeGQLiNX/pn1d5CHwDh8eMsok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782570586; c=relaxed/simple;
	bh=CbFG+wA6nI2eKrstUB4THGj4xzz+4zGpdKDblbL3HWU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uN5Uf5M1Zcxr5zV74Hken64vUT0bXLxUEb+uLC2CV6NRKde2243ZKdtWOo5ebmoYzceSsXoh64FkssqTI1LRTm4GLxENewZh2EOXkGQ9pJVbAZl2efpmb/565/aD1bqzRe+j153WQsqrJzpYqLyNdaG6BI5+NmLnnSFt0d5GO24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FZf7mb26; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FZf7mb26"
Received: from [192.168.1.106] (mob-5-90-49-163.net.vodafone.it [5.90.49.163])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8579756D;
	Sat, 27 Jun 2026 16:29:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782570541;
	bh=CbFG+wA6nI2eKrstUB4THGj4xzz+4zGpdKDblbL3HWU=;
	h=From:Subject:Date:To:Cc:From;
	b=FZf7mb26P7/obNSxWt9qasgnZ9JqMj7uptZWGajliHGEDheELKUPSClO78vTNB9n6
	 GoZxJOddJ6YRXag75/NiLrhIr4QloLH5dg/gcaTbG4evJkqq1LQGcpMvqZtzOXPSwH
	 e2nefZVKsi+aHipeeF/7d1H+dVQaS/Y3Mz53QGD4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v3 0/4] media: mali-c55: Add support for CCM and Gamma
Date: Sat, 27 Jun 2026 16:29:12 +0200
Message-Id: <20260627-mali-c55-ccm-gamma-v3-0-113584c05174@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADjeP2oC/4WP0WrDMAxFfyX4eRqOvThxnvYfow+yrbSGOulsL
 7SU/vvU5HFjAyF0BTr36i4K5UhFjM1dZFpjicvMQr80wp9wPhLEwFooqYw0rYGE5wi+68D7BEd
 MCcFLhTJMnZ3sIPjwkmmK1w36cWB9iqUu+bZ5rO1z+ydubUFC279NxBUI9XvkXpbZLZjDq1+Se
 FJX9T9JMUlOVpNF2wU7/EJ67IEzfX7x83VPLRKVgtvzY7M7qB7oWmku0Z0JSsVaYNXM185I6Zw
 KbnA/+Ux3WAh4TrGOjTTemaHHrtWKzR/f/FNvhIEBAAA=
X-Change-ID: 20260616-mali-c55-ccm-gamma-c02a0df59f98
To: Nayden.Kanchev@arm.com, Konstantin Babin <Konstantin.Babin@arm.com>, 
 Anthony McGivern <anthony.mcgivern@arm.com>, vincenzo.frascino@arm.com, 
 linus.walleij@arm.com, laurent.pinchart@ideasonboard.com, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2302;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=CbFG+wA6nI2eKrstUB4THGj4xzz+4zGpdKDblbL3HWU=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqP95UCwVQA29qV3KrhVRCghNqIuUbgmTGn1Slb
 2sP1nDtRg6JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaj/eVAAKCRByNAaPFqFW
 PM04D/0fNoiKlFrHfgKpR1hXrK1+9eDF2Bfp5hRIvNs+cBMeNvwVPGGdQ1cesrMBazT1pePdbGF
 BjOVORJ5Kp3C5VNAR5cCJNkQDhjibXgQzlvjms4FRBVOq07pPBAD7ch+RhVnl9sSW/0CCc6EROB
 a2uI7cyAXp3lHqJzRIjPYZbPZiecOL8YeM3lDIp2i07xbDq2QXZvz6LOrgxEqCkGJCx5Uf6ULXb
 xk/CZXQJSa/21pddh6NMbMTgJcN9YQTn5R6Ql4KQaCIQpVCwV/XhKj2RM1jISzVy87b/x3VIay0
 netwNx31hj8s5u1d4b7KQ4Dp3WXwZVu1bsEQN4Uc7EfFdgU02t3PHOdoJ8A/K8QQUvnpR4dIxZJ
 ZL9pET874Vqq3RYqEuxpO/mjNUZpyXviDavB/gP0Hf8iB/nGhNKfe2N8hjUyqeU7rVxYPzl/UZr
 tCBbIED3fj5J8/dRfA/4ppqGHa3nPUqRhHGdEGj9cK4h436VUhJiNbZLvYvx/iBcfDI7d+0f4zi
 5J3qkFUX/i1LUMAodjo2z9zE81DMr1mHrjTBEP+Ue8NOsNgauWJN1lyhynKG9eaQSgrmDiJhOhZ
 NrteznzZ+sBaBIMzzPJq+iZsabaZ8fNva8cvO/awGiDnS28QRM2dstkyj4BCxtxoUJjYETiYcqp
 0pp7+DLZsdeN1ZQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add support for Ccm and Gamma to the Mali-C55 ISP by defining the
corresponding blocks in the uAPI and implementing their handling in
the driver.

v3 implements validation of CCM and Gamma parameters using the new
block_validate() callback from v4l2-isp.

I kept the two patches unsquashed, to discuss if it is worth validating
the fields or we should rely on masking before writing to registers.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
Changes in v3:
- Address review comments from Linus and Vincenzo (changelog per patch)
- Rebase on top of
  "[PATCH v3 0/6] media: v4l2-isp: Add support for extensible statistics"
  https://patchwork.linuxtv.org/project/linux-media/list/?series=26929
  to perform per-block validation
- Add 2 patches for validating CCM and Gamma parameters
- Collect tags
- Link to v2: https://lore.kernel.org/r/20260616-mali-c55-ccm-gamma-v2-0-0f93e9a95d98@ideasonboard.com

Changes in v2:
- remove unused 'rgb_enable' in gamma uapi
- address checkpatch issues
- Link to v1: https://lore.kernel.org/r/20260616-mali-c55-ccm-gamma-v1-0-174fe4fedea3@ideasonboard.com

---
Jacopo Mondi (4):
      media: mali-c55: Add support for CCM
      media: mali-c55: Implement CCM block validation
      media: mali-c55: Add support for RGB Gamma
      media: mali-c55: Implement Gamma block validation

 .../media/platform/arm/mali-c55/mali-c55-params.c  | 197 +++++++++++++++++++++
 .../platform/arm/mali-c55/mali-c55-registers.h     |  13 +-
 include/uapi/linux/media/arm/mali-c55-config.h     |  84 ++++++++-
 3 files changed, 289 insertions(+), 5 deletions(-)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20260616-mali-c55-ccm-gamma-c02a0df59f98
prerequisite-message-id: 20260627-extensible-stats-v3-0-3b600bb2db8b@ideasonboard.com
prerequisite-patch-id: 2939dff7f477209138725aa8d86318d6580f4ea3
prerequisite-patch-id: f77370d8fc480b2e972a773f7d56f33ff1995eef
prerequisite-patch-id: bd3b231bc86129d25fca4ae34408a61db43bf883
prerequisite-patch-id: e44f05055f4bc9dc93ae6bd25af80c64f5ce627a
prerequisite-patch-id: a5f27213eba078f7ed5420d90df3ecd45151219e
prerequisite-patch-id: 9b2fbe610fb17689030c6da6c529f7db91b86d9c

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>

