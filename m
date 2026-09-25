Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031AA47ECC8
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 13:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344035; cv=none; b=RevUtBXU+RGtTdNQp5gZFaJP+2mUxtHXkWnMQKzL3DeIriSTyiFvbhlU9g3Yy7XzWV8vmyid2Uw3gHeD3/meGR94gi4IjvOtB4TvLs4U979XIpoXsk15nRq+fRSji6TX2MJ451SvePu50OymO0WajpWKTV4HjcR9C3G4qJYgxy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344035; c=relaxed/simple;
	bh=aFA+IkwFGLlI99ej5pv2heseaWItg+PJ/B0DqFwF4/0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=CvzAg5emWNWM69+AWuBBaE4zMij0ZCQ/xQHpgzHU4Y3sg63SbCKMurm4VOtJGUKj+jodEMlYQaw8h6pTmdUMwOBbfwak3KuK4KoiY+QAJtdbQf3RjTxT4VpftWJxrR9Ept/6Dj/eTGXX2JJjSuSJ/TykdR0tHNeflVt8kE+ktO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ovx4T23H; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ovx4T23H"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49febbce9afso6026575e9.3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 06:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790344032; x=1790948832; darn=vger.kernel.org;
        h=to:content-transfer-encoding:content-type:mime-version:message-id
         :date:subject:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7fwzOI7ESnx4XspZ5kvP6xBytIFtJsbqCHktLoWteH4=;
        b=Ovx4T23HqylfpCDf86dwjxY5Jb2JRz+VC7l9F5iUM7EiB2zpNshpteJvAeCUI7JuuY
         js83i1JJYqXW1yxU5K1/s2tlj/FDBfmyGX19w2QAMwWKRMuFFrlHtzsyvhKVYcMgnL0B
         UOFcbn59cAISCIlcLT5gLUxuSn7IXs80X9Ul7s1Pzkgpi6zAZVlKLhfVDUga8Qp7hXwQ
         3K7ywKTfBw/Ebkqa36DUPGvyTAYO5CY6yZTTy/YJcsPc+LE/bGFuRhES4Yk8X09P6tu0
         VHEICzXAtGMSPvG7HVW/noTY+1wcsBLuOfbXzCvPpIH9x4E1NqYspwI/UI/1yrv4LsR8
         jX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790344032; x=1790948832;
        h=to:content-transfer-encoding:content-type:mime-version:message-id
         :date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7fwzOI7ESnx4XspZ5kvP6xBytIFtJsbqCHktLoWteH4=;
        b=AvxdK02qe2zy64AXRUNavmUUQRkl4Xnlyeg6/UpA8G6htThubgk38Tx34VXyFZs3Md
         OW4cksPCVjx1w+qBhPDdeXASHb1Yy4ocxcU0ll5Y1zn65GLIIS8Q6Y9/TsN02cRawlSQ
         QBl7zaW+hwpQiPQ9k1HBhF/Y9fnc/e3CXACqzxpPss06Ig0oUW7zSYshxr53zKntCBN3
         iw68OsnYp2c9jvJypTsWlA3Kjezzz6e4+su+tH5CYc6/F5X1YiZKsCIDYwd8Cf9FnMiq
         ND29bsUiLEZRCf50a373UvlQbaSe9NiJAhaIkN/5hmdmF3i879WOdlZbcLPP2o4Y6+NZ
         qbMg==
X-Gm-Message-State: AFuF++maXBrHJdSzTPh/9VypIkS6tEsUCgwur+Vp6IJTBrAcHth4lj6Y
	Ytmx47nlHU4vAN/ZNaMOabB0T8TJ4KEoh70AN5VI3MBSPWHNwcFxL7TC/+o03A==
X-Gm-Gg: AYBFou1jvv2f6eaVqS80b3oGpj+5rT9mXzRIatnTzY+8kkOkKtohcEwXC1UapCg4zUe
	ycEjkPvZ7AXc6mmiisKQJkn/aXzJoE/C98h8LefC9hmoDvnqTbPHIndFK8pSPQT8+p/FL809nD4
	ltkzhhhXYyJyhY0waMCMIri2+Rsf1sNAZ7c/3Zi46pbQyD01pBO09FeebFjBxMgMYxBzcjcBuwt
	NFGEfn9rJc4sQ2f1BojOyWwAi1XrLdLuGRkGaibZE6JMVrFoLuGG1Z6xSYBgNNS3AEPj8Ckx0Mx
	x23WDqvMhxKdaSv/PZUvUmflBmCfZRGwZ+P/XXMqRaL8YnvcUwexUPTGBXXYOHZYcr/Xsv1KXja
	Ba4tP5BK8M0FBE0tJW0U0iEKNadZvcJaAnsmNO6VwG89dHfrZsc4AAxD+4UM1WuGrlDfJXGosoZ
	W0r8y8LqiUNrc1cmtO/2R6T6dxySsbffdlFjOSUP+g4kPpLLgp1q1ccP46Z1l5ZKkMKW4ni7byj
	Q0xh1iIUghkFEd1AiZhyTRCEakpUEekP1EfZxVBJyuRGaRkSTpVNDA=
X-Received: by 2002:a05:600c:1992:b0:49e:642a:4f6f with SMTP id 5b1f17b1804b1-49fe67048edmr99483085e9.33.1790344031884;
        Fri, 25 Sep 2026 06:47:11 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm7660766f8f.4.2026.09.25.06.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:47:11 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Subject: [PATCH 0/2] edid-decode: correct and complete AMD VSDB
Date: Fri, 25 Sep 2026 15:46:41 +0200
Message-Id: <20260925-jorth-amd-2-v1-0-41deccc043f0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMwQqDMBAFf0XeuQt2UUF/pfSQmG1dsVqyUQTx3
 5u2x2GYOWASVQxdcSDKpqbLnOF6KdAPbn4KacgMLrkpW65pXGIayL0CMVVBfO2diOcGuXhHeej
 +u92wVROtSSfD/a9s9aP06XvDeX4AXAIv/XoAAAA=
X-Change-ID: 20260925-jorth-amd-2-4deb5baeeb26
To: linux-media@vger.kernel.org, Julian Orth <ju.orth@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790344031; l=659;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=aFA+IkwFGLlI99ej5pv2heseaWItg+PJ/B0DqFwF4/0=;
 b=xKB6ykWYElRX70Qt2EEoJKmh39ADG580JE6s3J/CBKcM5Mx1s3f5oQYrg23K+qWjsbU/rWYcx
 dF/HBPYk4woAy/54u3InknF1PlRO2qpAGlKy6QKZynB2B1Kp0+hygk4
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=

This completes my work from last year. For your convenience, the diff of
the EDID database is available here:
https://github.com/mahkoh/EDID/commit/c5ab164b200f1ad51ed27e6e18246d6459282bfb.diff

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
Julian Orth (2):
      edid-decode: fix incorrect shift
      edid-decode: correct and complete AMD VSDB

 utils/edid-decode/parse-cta-block.cpp | 291 ++++++++++++++++++----------------
 1 file changed, 150 insertions(+), 141 deletions(-)
---
base-commit: f341ed8e3742118a86619e5f499017db2de30d94
change-id: 20260925-jorth-amd-2-4deb5baeeb26

Best regards,
--  
Julian Orth <ju.orth@gmail.com>

