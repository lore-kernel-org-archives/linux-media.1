Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7122C364925
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 11:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301189; cv=none; b=taszV+6oZn8TjVjBCaBVVkFly7djjMYEBaPTjmwDGlUymE16Y68XXSaWSbbndNww6Kdl9vowW+QUXTr687DOACNm8tDNHcCjCsPaP5HeRYbeHa6KkcmSAzdpd7rx+p8SGSSLFYeNpqIFIPKAOU+kt9/htmi7xIXtpNf6yYzg6PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301189; c=relaxed/simple;
	bh=HO/OlyaPGxIhxDkxihMk9sxj+ViyAxrrDuHy18SEHHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hLXhzrCa1UHVsb+LpmeauF65s4CCLT6Mzs3A6xYhK3tbLadVcCZRlneq8qchAcrnF2990dc9qRoHFnPFpPkdXluqFRWZfHHPeExnnc71vxEft+Ez6ujH5/iTAYXRqE1oOZs4h44tvSLEPI4/3OPHiWz5t+mEKFLN9EMEu2ehktE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Al8wxlHS; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=cGj3q7K5; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Al8wxlHS";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="cGj3q7K5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1782301180; bh=HO/OlyaPGxIhxDkxihMk9sxj+ViyAxrrDuHy18SEHHU=;
	h=From:To:Cc:Subject:Date:From;
	b=Al8wxlHSsuvhHKumj/ltr4lkojpgLNJL8ZNXGCkXZIamZXYtKRXqizmHiOoloxtWb
	 LB2NeKgdmJcTzpld0P2CLyOVho1Qqcs8lFzsu/alydHyvtO1nY21FyPIAPTyeNiW8J
	 gPB11i9uX6/4uvQHIHeVT5KCgyigyqF7esM8r2uTEaK7HYnQYYxI64u+epgfkHsCRL
	 LABFxODY8U0soX2YK/GgK/5cSazOnDK5zrYxypX9KJlSFZUtMa8o8patZRuVghGtfb
	 mEAnwPMZ1HxP87uIGqYQn1MleTgWHrcC+x/DtrDK1wIHbA/oBbgS9GcSoHMoroB5Wz
	 pH7Z4VY3DyRzg==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 8BAA74252E; Wed, 24 Jun 2026 12:39:40 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1782301179; bh=HO/OlyaPGxIhxDkxihMk9sxj+ViyAxrrDuHy18SEHHU=;
	h=From:To:Cc:Subject:Date:From;
	b=cGj3q7K5gtTShsHPCEQdm51iAU5/ci8RDzT6ul+0NpG3q4q3A7v8jiKyOvlMq+QYc
	 cl1WdfgIoF10uCksPYz2GFRzysOvfQ8QT//u4FK6GKmGDTFjzkz0+ayLY2wqcfkVcR
	 syZImAjYXc04j/krdAsgYHkY5cSDZyF/oZRvhUlLz+VCyU+aQcaZO18KN9ZzIKLrzt
	 TH1oPPKipkvdNBDV4CJgkUSyUKopTv2sSgYm2d4QIcQQ3NkhvQ5yCd+x8ijo08gimG
	 KBd1mMM16wLzO815bThRB7ENrRZ+RorhIYKdOlPaJuJ/nIAfmdx5+lUPu2fIrJO6nG
	 9lnWaKF/ly9Sw==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id DB502408E1;
	Wed, 24 Jun 2026 12:39:38 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Cc: Sean Young <sean@mess.org>
Subject: [PATCH 0/4] Cleanups of rc keymaps
Date: Wed, 24 Jun 2026 12:39:16 +0100
Message-ID: <cover.1782300922.git.sean@mess.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I've written a tool for media-ci which checks rc-keymap submissions.
This tool found some trivial issues.  

Sean Young (4):
  media: keymaps: Remove obsolete RC_MAP_RC5_TV keymap define
  media: keymaps: Remove obsolete RC_MAP_HAUPPAUGE_NEW keymap define
  media: keymaps: Ensure module name matches RC_MAP_VIDEOMATE_K100
  media: dt-bindings: rc: Sync keymap list with latest list

 Documentation/devicetree/bindings/media/rc.yaml               | 4 ++--
 drivers/media/rc/keymaps/Makefile                             | 2 +-
 .../rc/keymaps/{rc-videomate-m1f.c => rc-videomate-k100.c}    | 2 +-
 include/media/rc-map.h                                        | 2 --
 4 files changed, 4 insertions(+), 6 deletions(-)
 rename drivers/media/rc/keymaps/{rc-videomate-m1f.c => rc-videomate-k100.c} (97%)

-- 
2.54.0

