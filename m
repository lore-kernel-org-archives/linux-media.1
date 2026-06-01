Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4D53D9DBF;
	Mon,  1 Jun 2026 15:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780329076; cv=none; b=DOtAJ9JPsklu27zSu36Pr64K27iAgynsJNsydalKARCqfiBRfvTW8M2wGn6T8iDFBoltti1vkIqaBrTLSnBG3bSPlrPiVLAnNKdEV5tNHttw28uXJVhEWpi8UTAA3N0k43AfHkcAv5skiq/nnfWUbhcs1Lvrs06mS9WdfRn9Fh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780329076; c=relaxed/simple;
	bh=JY7zz9NJCKHNUNvZCrb4k5So6BkQETIZwSljPbC24sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DdQYC8rQDUKdMQ6nDwH7afOvJlKcHZoXILjBcTFABukSfiWdyxb3UQJRkocY56Qlk8snDVQ5fuvqS2r/LHDbdxCTxFyskqDfHcS3QUBZHTBx5oSYCkcqiIIiXq1+77u223hATyKRQRbE3tbzsKDVpSKCGMDYFWQNiVhNd2bt/Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RT5n8EJc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RT5n8EJc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68AB71F00898;
	Mon,  1 Jun 2026 15:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780329075;
	bh=O1KiAelcSpQZLy5k4bHkmZ4TfiHTuYkSg2fvs8aERzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RT5n8EJcoKJnQghYPSYA1NlQNbR1NDePAnFDDOZGobE7OaYUjYGIT/Upr/o3jmHBo
	 7CWeoJg3NdxpQXrzKEHyMK72yRrGdMi/IRaL49HC0mZyavti6Q0NXeIz7YUA33Kr1R
	 D8b446jq0n3bThHZxDxTYlu+G0wMYAACNi2aI1/8en8gRQ7S9y/grsXwTAcFwcKxZg
	 3akJmUOvKkg6gMmU1blPvGgjsRAblXEp647FghOqXoc0inSfEBOy2KMgC3S1u03xVW
	 n0PyuF0QFmg2biaPm79CpXb9lv2pEkoPB20h8jjLVLAALvzT6eqtNK2mZWUgkMfXsl
	 TGQeUH3rw819Q==
From: bod@kernel.org
To: p.zabel@pengutronix.de,
	xavier.roumegue@oss.nxp.com,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bod@kernel.org>
Subject: [PATCH 2/2] MAINTAINERS: Add myself to dw100 as reviewer
Date: Mon,  1 Jun 2026 16:50:59 +0100
Message-ID: <20260601155059.1332290-2-bod@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601155059.1332290-1-bod@kernel.org>
References: <20260601155059.1332290-1-bod@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bryan O'Donoghue <bod@kernel.org>

To facilitate cross-pollination between one arch and another I'd like to
add myself as reviewer to the dw100. We discussed @ Nice it would be
beneficial to have different maintainers reading/reviewing things not
directly inside of their remit. This driver was mentioned, I'd be happy to
join in.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ec0743b41a463..35368c2ff0ca6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19243,6 +19243,7 @@ F:	drivers/media/platform/nxp/imx8-isi/
 
 NXP i.MX 8MP DW100 V4L2 DRIVER
 M:	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
+R:	Bryan O'Donoghue <bod@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/nxp,dw100.yaml
-- 
2.54.0

