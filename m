Received: from smtp.mohammad-abbasi.me (smtp.mohammad-abbasi.me [94.101.181.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F302C35B63C;
	Fri, 19 Jun 2026 11:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.101.181.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781869169; cv=none; b=HuIktbPRC9FdK8lCNrlt9+NhAgaZOgmFaTctVtWS9pN874FCj9O80hzVuzlnUkna3B0atGqVZrLromNVi7+cHeAaqYorAWVJuunmqU6AzgoE92nWgLZB791a30HNpiXpglAav0OuqEfiFwcRY6Lw1I0224h+CYbIzfg5KwpFMqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781869169; c=relaxed/simple;
	bh=SD9pDIGWybQweBTpEcCVt/d09bjpeY4ScX8V1qoppeU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PyaJNVmWUhB1Vp5bNT8zrJ66fhhGP6Jpw/et0zbYbXAAjqJPgZfQaEQQq4N5iQwvg3UcDh7T8LlG0fHWdrDGuJXpIEx1HrjLHlkd/Pi7QgNBbKSVfhtJehIVfdsqFV2x8Bcuy8vZcpeMAIxVcppjqwAtFbse9OPgSQZ2bK3up6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mohammad-abbasi.me; spf=pass smtp.mailfrom=mohammad-abbasi.me; dkim=pass (2048-bit key) header.d=mohammad-abbasi.me header.i=@mohammad-abbasi.me header.b=PqOpgzeQ; arc=none smtp.client-ip=94.101.181.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mohammad-abbasi.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mohammad-abbasi.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mohammad-abbasi.me header.i=@mohammad-abbasi.me header.b="PqOpgzeQ"
DKIM-Signature: a=rsa-sha256; bh=pt9ddXZcHlvNA0OerH4tSgmf+ADKkR9Q/WNTXAP10Cw=;
 c=relaxed/relaxed; d=mohammad-abbasi.me;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:Message-Id:Message-Id:References:Autocrypt:Openpgp;
 i=@mohammad-abbasi.me; s=default; t=1781867956; v=1; x=1782299956;
 b=PqOpgzeQRamZeNosEs9sfOdCZ+kvm8qJD8Ked3KgVOOJxvX80SeOJHJ6qk3tBGP6IWiHDIMg
 vhp0Q/qffcEZEYCpDDbgDd0nxSqkIgWKwxxeD3GQoyeNJniLL8lROrn+yteiZ7WElLgfkl6HYDa
 cK1x0R2w1YB2okrqShiLR7hvybVlp0iOkczHLcNK+GHKzldd58dCUA/EBn5jnkIwQ7CeKzBZlxA
 H2Pv3eONj45VihVsEPKg42jt/LUekApWom927z+zvH89Be4VMKJudxB9z/Vh9aCfmlSNk98nAvQ
 yzXxSs5lDoTAq6IDnf8wxNjaOXiofFus1TyVOFF4peGOQ==
Received: by smtp.mohammad-abbasi.me (envelope-sender
 <mail@mohammad-abbasi.me>) with ESMTPS id c8da53ec; Fri, 19 Jun 2026
 14:49:16 +0330
From: Mohammad Abbasi <mail@mohammad-abbasi.me>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mohammad Abbasi <mail@mohammad-abbasi.me>,
	Mohammad Abbasi <mohammad.v184@gmail.com>
Subject: [PATCH] staging: media: atomisp: constify pmic_name array
Date: Fri, 19 Jun 2026 14:49:07 +0330
Message-ID: <20260619111907.242382-1-mail@mohammad-abbasi.me>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following checkpatch warning:

WARNING: static const char * array should probably be static const char * const
Signed-off-by: Mohammad Abbasi <mohammad.v184@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index a1d3a1692..d628fe4dc 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -109,7 +109,7 @@ static enum {
 	PMIC_CRYSTALCOVE
 } pmic_id;
 
-static const char *pmic_name[] = {
+static const char * const pmic_name[] = {
 	[PMIC_UNSET]		= "ACPI device PM",
 	[PMIC_REGULATOR]	= "regulator driver",
 	[PMIC_AXP]		= "XPower AXP288 PMIC",
-- 
2.54.0

