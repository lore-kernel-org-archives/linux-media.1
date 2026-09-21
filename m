Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F3B3C3F5E
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 10:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985849; cv=none; b=J4q5PdCIBm9HhOASfa9GFvk207h8b/J7fvvs7ZqeP4Ih/ul84lT5sEuYtIyCw5KKbrfCzl85DJ7dhci1DjsFn7jDt9qw47MTjoqXYZy33Vk0IJz0CfAmBYz4aFDyTepHrwCaGy/WILgYs22+zjIzY53MnazKzUkNrd9LYpSHjQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985849; c=relaxed/simple;
	bh=WVwfnRuyvaeG++x3gwgYY3YvNYXlg6og3/kI4V+KiAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nUyDwMU26CuedKrLiG49BmoDnTcckmnxJOtf3bTfJ4S5lsqnRyjQXhXYPtAuoB4PEQEWkmBJCG51pF+6+U+oGA2eMdU25rpOH7hiEUEKGdvuLizzdK+Q9ta4Ccuye+JS4YCi/AAEKKDv8FZd1wBmQhymEmbG4rcwJVXK7nN/nyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ly9hubgz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ly9hubgz"
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2400:2411:160:2f00:ada:558d:7717:d96b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E0B1D0;
	Mon, 21 Sep 2026 12:15:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789985740;
	bh=WVwfnRuyvaeG++x3gwgYY3YvNYXlg6og3/kI4V+KiAc=;
	h=From:To:Cc:Subject:Date:From;
	b=Ly9hubgz3j0DPWhcl3mF9jNC15HcwzJLXXt7AZI0FBmKpWkC5/9kBefM+jUosC+Rs
	 095xJtFb68Pwn+Tkbiu9h7/K9FcdL7Ookihwfi0CgZ25q2/EZ+1a9EfyNw7i1bZebt
	 R9HJttPRU7NEiwQxdGOQKCcH+SslY1vcffloML4c=
From: Paul Elder <paul.elder@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	sakari.ailus@iki.fi,
	Paul Elder <paul.elder@ideasonboard.com>
Subject: [raw2rgbpnm] [PATCH] meson: Fix license to match C files
Date: Mon, 21 Sep 2026 19:16:54 +0900
Message-ID: <20260921101704.3052292-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The license of raw2rgbpnm is GPL-2.0-only, while the meson mistakenly
declared GPL 2.0+. Fix this.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 4fba1229b691..aa34af767b89 100644
--- a/meson.build
+++ b/meson.build
@@ -7,7 +7,7 @@ project('raw2rgbpnm', 'c',
         'werror=true',
         'warning_level=2',
     ],
-    license : 'GPL 2.0+')
+    license : 'GPL-2.0-only')
 
 #
 # Configure the build environment
-- 
2.47.3

