Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D630A2C027F
	for <linux-media@vger.kernel.org>; Tue,  4 Aug 2026 07:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829890; cv=none; b=EUrSXUPsiwQByp/rfuvXD1qLRC4uaJa84TLtJkGM9Qo+nQSXyWuE0ZnYC9jVHrNvtqs0LetJh11+eMLJ9E11jOAAxQEEXIWU8sKrjXYkn4W/JuwqxtjtpV00uIjqoSwKqQVeyhWjjNvxyxgJ71KlPW1nxHQKCHBndQuYV3wzYhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829890; c=relaxed/simple;
	bh=fSr1rgwn1r3t5l/b8GH2ft43ZdtOXELqfGPNorUfjz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QFuALJNz0Qv6Jt3EtzrKJbxnoTOnXzWsiVzIAmUbAK9B4+ENhLXrZnpPHtEYrpoEq+p0GBxgu0OHJN9aNUwlntQ8SxrusOegkt8Vxce3L/nVkG4Mo23lt1kRUll6MXhpNF8Rx4mHb6E1ciUYuEmN0CNUbsetICdRvCwnwCy0WnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jv7zoc5H; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jv7zoc5H"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3811f512167so4361453a91.3
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2026 00:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785829888; x=1786434688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U9uEU/0gVr5vf0fte1b3bzS5Fgv0F3rU/mjXt1k0U88=;
        b=jv7zoc5HJ/QhgLDN5STqAysHy9/can6zaUCHuaYzjOonejiHuzBK62m3kxMr5ZuqrC
         jfDBQZnlrD6lKrb58Pd6FPoS1hmGRIt7vb0sgupJX4hKipKBu0RPgddLdf6+PIy8nZq0
         lcYy4yKgDzMpbTyp/gSHeO+UU09nRqT5bCeTK9bWTNkFOXH9ZL8ZCGHtzR1r6wMPeNM+
         lm7xPkn5J1XKG80yHLSmvaXtBZZ/fqbbTbQri0O6xxpFg3awFH4GEVffyWgDxT0989e6
         0oJS+S94G/YT8izCwkv78ftJ71/2oEeS61DiI7l/JU6AgP6k31O2SfslZdsWDgfdOEWU
         TsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785829888; x=1786434688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U9uEU/0gVr5vf0fte1b3bzS5Fgv0F3rU/mjXt1k0U88=;
        b=o8pLlqZWoQHCuzsjKMBOi16+7S5rdfo5klL2S+Gj2+x7o9yRLDbiGtFHGnVUobYFJB
         E+YjyJA8b+IwAvJ1u095+cvxkL09DETXt8UUrkusO385n6ArgAkL7JS/Sxe/eVPdi9re
         45faGlQOuj8BWbCjDVYQHgcFmgCW60g16qZijcz8fYl6wNc3rebJr/Mg2phY9kjcorhm
         QnKYCfKfulDldDBII1I9YVTlgHCgiBZpAFUr0m0gVoSx3dwel15aFlpzftNUsEK5Y0uK
         ADz5rCd3Mz43NXlB0bSduMAZYTaud8Xyp2Wjqz8OYthRapTDa73iSgsaaLCI+qrhtK3r
         a0OQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJCA/sXHuAUoioEXIoz7bxGfTh+lFI68W47TiLfQMUOZB2iMZwZ3cRiSlund/NWKUBPbZSz1afiZ8Y+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh3dwZn5oJcoBUsKp/mTbJvhF2Gf38L9kLtgujCys1vroztbOa
	O8DG4gccZHf1zRSujW5fUfXNzU//R8+xQMg0wztMNNm3fpT4xTFBNn8k
X-Gm-Gg: AR+sD1082guOdNYu17Rmw/uSb+PKD24Oo3LtzByyo9rMFcdJj3Ce1IRiylGQK4eUF81
	AqV+4J3tgQMEdO6la/vbzuL0/mR2hfHruWOz/FC53RXuROFGMT3kdujFmSkIP6m/F5g3oVvNGcx
	9Zgr4kpSB1RmU5mfJOdsrG9s9+bRVu6sSCI7hay8Fg0F7eM2CSC7/NoL7lYfmdG3TJDlGrMJlu2
	LpLK2ZG+Ba+Op3WLVtqXcOzLiR7IYMOmQk9PMVrcB79SLtx+eOeM54cf/Dtu2oi45XfdpE9IUG2
	E5SvQ2gsApfls0bNrP4zG0vPrI2vPuROifp21G+AAilb5g40Vfy6zacvWmq8o+cvT/cH2vO4xDk
	KMMwnN/SWJVkLbikfei0HNIE88N/BXKJI60lJ6c7LOs+pDYUAVaEncxkmY841SW6OwyDb5w+T+q
	XHVGReXEC0K3RT2IYV6SN39JkgWtoF8uB1LYosLM3NicLNX1kL0mo0MPPvXYxMP8ekilk/86WlB
	BJ/wWA=
X-Received: by 2002:a17:90b:2e06:b0:38e:ab33:9551 with SMTP id 98e67ed59e1d1-38fbc60a11emr11424230a91.42.1785829887990;
        Tue, 04 Aug 2026 00:51:27 -0700 (PDT)
Received: from Vicious.localdomain ([103.37.82.147])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586777bcfsm2389828eec.21.2026.08.04.00.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:51:27 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH v2] staging: media: ipu3: remove unnecessary parentheses from return
Date: Tue,  4 Aug 2026 07:51:12 +0000
Message-ID: <20260804075112.15695-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style specifies that return is not a function
and therefore parentheses are not required.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-css.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 8063401246f..84fc98dd352 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -1400,7 +1400,7 @@ bool imgu_css_pipe_queue_empty(struct imgu_css *css, unsigned int pipe)
 		if (!list_empty(&css_pipe->queue[q].bufs))
 			break;
 	spin_unlock(&css_pipe->qlock);
-	return (q == IPU3_CSS_QUEUES);
+	return q == IPU3_CSS_QUEUES;
 }
 
 bool imgu_css_queue_empty(struct imgu_css *css)
-- 
2.51.0.windows.1

