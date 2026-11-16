Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830835;
	b=qcNOGn6k3X41gZhi4wtmPtmZxsIM0xlTZ3w7BUWjiPj6ANZCiC1C5WzQjk2YjIGGb1Dm
	 s72CgIyBLdbdDNMbqbn2DLnVza5FVKx09YOzwm8T4sAC2v49kfH9CMit27o/PLlRFLaU5
	 PDFCBxQ2BC4n7CEWoVKH7FEnM5ARI8L7x7ZrGes00Zyqbf7EbcBfkPWyWDxW2wNS7TUB4
	 xGuEutSc/wqN7hc05jpNszIVBPk/wK9zCNXPlsXZSqerZyQa+SKGDaqUso62hK3IKqjTF
	 atDKUxCjqyzBQndwKkrMJ+XsxkSr3Mlr8CQihYDvgBoCkbmMbwnhJChzkYobLi8vTXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YTgCfMhAtura+nyFnS5QD3/WgVT4AUiTNomC6btACpw=;
	b=bSsMG8vz74UIQVQ885um7EXhbU9mImxDtJCWr75RRxzEPxSHn3XHu7wNttaFTPS6f1sb
	 HK4V7au/vf2N0kx3cFmlnXnuOi7xOzWbHMtOdRWQ/Bmfb4G+deC+k1yfozA/EXu+xfH7c
	 sEPlfEZTlM6/ihy/ul3cLgFP590R8E7lIcs0tHb358z+xcSKiohm6g2DZnE0uDeomf1g7
	 ZjPWSZH9l4uZZcnPUYiWMDkmkiXNyPTLGqi4px8Z4MCuCyqDJgqJMLO5Hn0AnHfWr1Hbu
	 iShdkh53sMMFLFBUu5UiCQEll8o48NFCf8n7jZWgXdAyz5J+vlDvs4dsvnQAl/9NgVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ykvNzgEi;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CF6606A31C
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 12:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9CF6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ykvNzgEi
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so3730895c88.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 04:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830834; x=1795435634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTgCfMhAtura+nyFnS5QD3/WgVT4AUiTNomC6btACpw=;
        b=ykvNzgEiJ5q0JKeVEZZqNRc0lE639nRlALND3/BRGCL8lxABCc4zBZh+ojT1Bpe3QX
         0lsyl5sjFVvlwA2EYhY+Se+DV6rOPPPG1uM22uGfBZ6rWneUcgRDp9zjlWzI4PQD3qXf
         VRO71udgkwhGaBA7fk7X1yuZW5/Xa0fM0ZjAZkcRC9c1PBRaYiCceAvsrbwbOHTh5NRj
         NrljSQDO/I2RoX/oUPm6GiGrkYC1cs7IvbgB4gYXDAcsO/hqqrJ9Muq+tI1WvjJXAaJy
         J+x+iE7jxVUultENc2WHPjfooAAmcCUATIKabY4ZQCHxnPSZOqVx/u/luhUdWwCHLFCr
         yHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830834; x=1795435634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTgCfMhAtura+nyFnS5QD3/WgVT4AUiTNomC6btACpw=;
        b=y71/KyJ3SfpXylVZ+meXYEvhHd49MB1R5t+hzx+DI1QGIC7SJm52ei8Yn1x/FHLkrU
         ayQWWKGi3e16vOr4djohZpGPXHHVxg+N6C9w3eeGOmUgAEjjGdS4vTWN9LkJCGHs+S/d
         bLQNp4IElsi2NQnNtOHMy6HqDKYxtGjuAg/DFvqIPVnzXv1eySW9Bgobqy8+MdVaSlXR
         6xj0SZlnClGpxQBuSIZBUzUNq7Ko1xcJOie6b0AKxhFCbs+7bJXk+ZqrGaAGbROi618N
         eRikqWMoAcQgYO9xRZ25E7+JCQHsc76hiEd6xcs6045Km4gGcMW6rFQ53LZAAQxVq2Zk
         LAjQ==
X-Forwarded-Encrypted: i=1; AL+hErF4wujb2/JH5SraX0oE84IXgZHZMlAmBgDn1ALl1mEUMqmRRoZhEGZIf6T+aWd+iSh+PnvSMIAj6G3dBg==@vger.kernel.org
X-Gm-Message-State: APuU4Z87p9/4gpxXhQiSHwInyvn2D8yjiKjlRa9VgPvXXgrV3QwD9rxE
	ehAvqjkJuBvqbenSVg3R/pJYKNNGheGfQkzEO5gVrYT1LuBZRdknrwp4
X-Gm-Gg: AYBFou1a4d5aHR6ryZQ3+hJ39+LeuI4ZhFPjMls7QUp6DINqe82uNQmicYJY8QGhmur
	taVHduOOeTpWJIkYKqoH6bvmmHNpMkXO3Onl6E1rKLmiU+DSiBFtVznZy66V1yZvRP3Kc9RhOoP
	9bkf81dPokiXx+kNCpxemb4RMSh/s5OGtOkRpv1AT1Q8onEwnwtl/OMXuxTwrqmtVDS+7+0+l/i
	oxeL3dxlEdl+AaGSum09MYn8Buvf6J2i3yXc5lBCfi7O1Hv46gMvBPZc5kBSE9gaafBwmOwagKC
	cCW+/OK4pL2ki/Gky8v8fhzz6ixpBBKyvFdgiXiuz3HQQU7VcCLvmqd2oxpY1FILvvwr/UkK+uA
	sKBJDCKoaN3ssX5e+J/zFf0XOrmujsiGGzwJfHy86E9nK+potfBFyxqS764pToXmZbDJuCUIAwb
	r0WP2GTaZIu2NIYY8zVxiBXJEuZ8z3MG4nGDCcKICX/oJ5gzgdo3v+0QHez9q1aWIHa+c7OylVK
	B0+wR/4hPBE2TdX8Rz3Jq/v6iMVdpOHHrwUwigje93WlGhgZ+wuDD773LWPFc6zUaPBlyynl4OP
	nZSsjRnNVMIPgDnO1EzZITHarXJrnX70jvq68QsJ6fe1eHCajly4OTb7LWRxt9cqH/OW+/RQbA=
	=
X-Received: by 2002:a05:7022:926:b0:1b5:2bcb:8691 with SMTP id a92af1059eb24-1b52bcb86d6mr4763177c88.42.1794830833599;
        Mon, 16 Nov 2026 04:07:13 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm32146157c88.11.2026.11.16.04.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:07:13 -0800 (PST)
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
Subject: [PATCH 2/3] media: atomisp: Remove unused get_sp_code_addr()
Date: Mon, 16 Nov 2026 12:06:57 +0000
Message-ID: <20261116120703.6681-2-chaulagainavishek14@gmail.com>
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

get_sp_code_addr() has no callers anywhere in the tree. Remove the
unused function and its declaration.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 .../atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h     | 1 -
 .../staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c    | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
index 3cd69284f..e00308818 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
@@ -26,7 +26,6 @@ typedef struct {
 } ia_css_spctrl_cfg;
 
 /* Get the code addr in DDR of SP */
-ia_css_ptr get_sp_code_addr(sp_ID_t  sp_id);
 
 /* ! Load firmware on to specfied SP
 */
diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
index 78f00f07b..49b986351 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
@@ -104,11 +104,6 @@ void sh_css_spctrl_reload_fw(sp_ID_t sp_id)
 	spctrl_loaded[sp_id] = true;
 }
 
-ia_css_ptr get_sp_code_addr(sp_ID_t  sp_id)
-{
-	return spctrl_cofig_info[sp_id].code_addr;
-}
-
 int ia_css_spctrl_unload_fw(sp_ID_t sp_id)
 {
 	if ((sp_id >= N_SP_ID) || ((sp_id < N_SP_ID) && (!spctrl_loaded[sp_id])))
-- 
2.43.0

