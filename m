Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830838;
	b=yvD1oe4TZaWBnPhWeAhylET0BcGlHbKgpJcRX5wPgO00CQGGW3V1hAyVhd+TUF+xo3if
	 EvwAgehQdIpThrilpEkAQF0ikoC4U2c0oUVCRYpOQGoj2mOWMx1ryz5NMftFqF7KkIEkq
	 jz2tFzgYbIodR5Jcac0vPEmclZq2g0GTxaRWUWOALjFQ8+/QIW74JB0Q8ZkgiprPqtzPK
	 YfEBRmfEIxpBxX4JJ2qYd2NeZ5XWV8Mq9X96HF2qac2wNDRaYaDRdICPYkP+/4h1dD2jT
	 qdWOcCvcq0NoMv1HJlCI3WnvuaqEe5mcY7HD50WdkYoY/FI4Ab2ewYLMHxlz7tqQQ0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VQ9fMu9NMp/tbco4p1dhzyKR+F65QW6o/JsPZ/GtUjw=;
	b=JXpgCv0MEVqWPCRgMscKERjCSuYrBWKGfpB5gWKAtEPb7S6k6+RDN+pJ8oREK85fJq/Q
	 tzXHGkJU2j8CfTujXC0NME+v7UVSF8cBaHipxr0PaFwr0ydWTvLGLiRrlKdqYDayqHsaE
	 ely/5OBzGkIc71VY0vusVJBmfa5OZ1rnp10o+Ig19vjTJ7Kk3j/10o+RK10H9qKBLmDj8
	 AdRNgqOePI83SO4NKuhSf4fRWMhlBFLqu8fWTyA7OSKxvOs6/zc2GCeT+yIcJJcW/0oEj
	 1M9hfSNDeQz2g/n81hzx9zsni/WsSui6xcI0Vyi91h+aPRBfhCUqnJp/EnAxzssZAGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=erOipV6p;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B645606A32A
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 12:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B645606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=erOipV6p
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1aefd1bf74aso2486013c88.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 04:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830837; x=1795435637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQ9fMu9NMp/tbco4p1dhzyKR+F65QW6o/JsPZ/GtUjw=;
        b=erOipV6pLuuVWDPxlwozZpo3CWMAkKjgJtdW9SaFoRLOVdIyvsDCGXICfmTS5F00kf
         ggjOAxV1QekxIaYPspg9OXt5baNILf3bPITlKwlTcujsXLanNrJosaXJDBX5zCtS1CCl
         z3N+AuEYv1esxmHujjJszcVlLHiIfhvai7VAzo1aVkOwCUEAjp/3P+8zX73+UhDlu01b
         4LqTv5cmkz3opF6GJwhvgIDpOwi4M6Mv7DOu8iWF/p0dU+gMTpOosaWn2vVszvXQjwKb
         Y80VZ7NWYOd4Fj519/jgqrq4mT1oqXvfYBy3vNQCFkoiBa6BxUxlKXDvUpbJyHylKY7f
         byRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830837; x=1795435637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VQ9fMu9NMp/tbco4p1dhzyKR+F65QW6o/JsPZ/GtUjw=;
        b=VbVlwV9bWZiTuV795yNJxQM+QY/ecn3ehBUknUAA3Wce/mNombeRzW//EM6tkCrh18
         tCptWyMuuc5NN4sj+UiKORyxEN0Vnd/QyTQf17seHC2jGcGQJRyYp7qhpsXs87F9d7wq
         Kl0bsgcv3PHSqWp9LXNvvA/tWVm7Qvqb6czyFeUVJmforZ9aVhbPKUOGVBgX9AxLQQBI
         89TT+smhko7fjUZMYpifEpd1TkoKO86TmURmZm3UJyKhiWCYRkwKZeZIfcwfg8BeBnH0
         4EwRQ4SR4CjGuCfymytPi0hz9ykR24M7SEe7VeA5Pyb2wgHJzk1dOrPePL57wiRn9Ipc
         ZfsA==
X-Forwarded-Encrypted: i=1; AL+hErEjzRRkbn1diMalL6Xw2NNJ3OO284P/8c+10BE2o57UM9TLxuANW654GP0Qy0cYGX8UXDk28gy5lnh2cQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9IQ3iX/IWdCWYTkYFnfErwyOBMylR9krIXKwLxGqaisx1K4vdS
	6DNz+4YYMDPj01hIRlIGmjcRePgpeF86uWICiE6S8snvi9yHn+vH1mrL
X-Gm-Gg: AYBFou3K9EI028b6L3W/6VOdx3VFHFU5748teoekpIJGvWFr835tsaq/Kh8iR5/37Vc
	nHass10tMfHxd5/WpAxETIsqSyu/0BVYRMfYKRsdSksDRUqZiwDb8yBoek9a6a3bZjsBr92QuWW
	XaAUbdU/LRyqfl07fp72p7kBMiPbawvvJfUsEYGHL5RUNL8+lMyC5DCDbFBsqVlhwrx2oZmfsBZ
	A5/4W13qpiYUXpYl0lhzzp+8RV0Fsf5rROsyflHW9+Y1rlRXKfE5zyoNHUKetiJgfol7IjSrsUV
	SmE4lDiVGUbJFHDzQ8AnMGuEw1Jkd3gZE3v0BMB8lFkG/3zV/dyk1qggZrpwrcuLAIrOauPPOpF
	MgwsYcqaMNmxCZ1kDN5UNMVy0Lk97OpIkXLqyazBMeXemmWj6Rpy0idsPzpBHc0Ao6YIW4p+gFr
	4Uj7Pnao307nb/mp/AOlHxi2fW86i0Txrf8cf3WARXOp35WFsdZN9r6BRhG7siESFz4VEXhDacx
	aF38Cixx30pMulKho5svn2bH3OGFHd+kKKO2h3CtMDcFyzsoEKcUECKfCTb6YO34q4RW6SGBslG
	x8j9lW+3F8yKFJErZ6HtiZgOs/Nd0tBkkvds7Aor8TA6wIxPGuiLj4O15h+B/dqIi+b8tFPdNg=
	=
X-Received: by 2002:a05:701a:844c:20b0:19d:233:989d with SMTP id a92af1059eb24-1b5030ad3bdmr9029261c88.14.1794830837228;
        Mon, 16 Nov 2026 04:07:17 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm32146157c88.11.2026.11.16.04.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:07:16 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH 3/3] media: atomisp: Remove unused hmm_flush()
Date: Mon, 16 Nov 2026 12:06:58 +0000
Message-ID: <20261116120703.6681-3-chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
References: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
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

hmm_flush() has no callers anywhere in the tree. Remove the
unused function and its declaration.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm.h | 1 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c     | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index a7aef27f5..545bb52c5 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -32,7 +32,6 @@ void hmm_free(ia_css_ptr ptr);
 int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes);
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes);
 int hmm_set(ia_css_ptr virt, int c, unsigned int bytes);
-int hmm_flush(ia_css_ptr virt, unsigned int bytes);
 
 /*
  * get kernel memory physical address from ISP virtual address.
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index f998b57f9..f9abb1618 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -263,11 +263,6 @@ int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes)
 }
 
 /* Flush hmm data from the data cache */
-int hmm_flush(ia_css_ptr virt, unsigned int bytes)
-{
-	return load_and_flush(virt, NULL, bytes);
-}
-
 /* Write function in ISP memory management */
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes)
 {
-- 
2.43.0

