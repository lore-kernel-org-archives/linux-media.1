Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691631;
	b=CPPZ0YQmHUXHfBqXtraiFZrSUn+c9gfp3ptVY9Con5N9cDqfuQAMt7LIXsjJT+ZcZdAm
	 ZvYwUBOy275BWSQzGl3Uib+iI11gfWrzoY/ZFu+ohyC7COlrCSZmK74c8nWreQmB6GaYM
	 cYBeCDhv/69c7IQ87pw7Rc2IOlAzI9MLnfEwWPiZ/RyYTIOQUoXbnJcPthyU/3dAhojZt
	 kjv05g4A6PWDjaUPtfc9haklW/g2H8f5rGg3dgBx8Y8purZNgiElXh4nNwFdyrOunzQnj
	 AZSxTEO7Cm6IWNGXfWXzs870Yd01YB7IBNwn6Cow6YgoxRGTeUJ17mz01uhe1ENb+mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691631;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=/OIKB0qjolP2ztLXi2lVLr/QNtGeznSTbUgzPs8K/nE=;
	b=H1aAaQzlMu8X7Enm8wT/hOb5wDGjh8xe3oWUfiEBXn6a/T3lk+KVK6znRXKWWLTKPZaU
	 ibkXtfaVEvc6/GHOpuNKhfvm+q5jzBc/6HIPolkmOyh5lD2w1AwqDKj1TlBr05CrJBvNa
	 PlQAuX5RR0r723D7hhHRJsCbEnSmGBe0FSro/NvBNB8uf4cYYedyqaAYTonUWsUJyF+0m
	 /1w+MEiVIJ18pt3FuY5eHp7gIVtEsfCWnFms2fasyU/eujHYwnxGC6s5FotaUG0pMW5No
	 EmSI4t6kvtgx57Vp0M6BphRFGdbjstPRA5ObLLp0MKL3A45m1E8eFyW7Yw9ML0j0uhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GveICwjq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F08606A334
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GveICwjq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815651F00919;
	Tue,  3 Nov 2026 07:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793691630;
	bh=/OIKB0qjolP2ztLXi2lVLr/QNtGeznSTbUgzPs8K/nE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GveICwjqTpFSI4GIAK8W4j+6Af2X82KZMOzHaCGdPE9ZrBQmQbmC9uRKDQkhqN9Uz
	 nzXDDUN2Ac/yr8Gr4l5LdeoCZ0OCcm7955gg8BE1/UqMIE76KoNn0ftiCrl8NDP6Wg
	 W45BhAKi808/TVkWH4jrxUm/s07U/U+fh8IhwC27tpVSLcc19OYnSRMhXlUhsHxKKf
	 NYv80k7tfKjCIkatFr91+v5Etk2psZL4IgvzL/gjvnhKM08+mn1pfQFd55fjBORzX3
	 xbFJNRH+w39D2ljqaYH6a/5Ugo2EJ5Q9OinpW15zqIaGROHKB91Cd0yo8j0RNpTD3B
	 5VPu9fpbh+WcQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 05/13] media: cec: extron-da-hd-4k-plus: call cec_s_phys_addr only if EDID is present
Date: Tue,  3 Nov 2026 08:31:56 +0100
Message-ID: <6ece814cc7e99bab9aaf57bb4fc7881fe3e47133.1793691124.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793691124.git.hverkuil+cisco@kernel.org>
References: <cover.1793691124.git.hverkuil+cisco@kernel.org>
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

If an EDID is present, then call cec_s_phys_addr. If not, then
call cec_phys_addr_invalidate. This helps the CEC framework differentiate
between CEC_PHYS_ADDR_INVALID due to no EDID, or due to an EDID without
a Physical Address.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c   | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
index 1f8ed7ff31e5..ae3628767ac5 100644
--- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
+++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
@@ -643,8 +643,12 @@ static void extron_irq_work_handler(struct work_struct *work)
 			extron_read_edid(port);
 		}
 	}
-	if (update_pa)
-		cec_s_phys_addr(port->adap, pa, false);
+	if (update_pa || update_has_edid) {
+		if (has_edid)
+			cec_s_phys_addr(port->adap, pa, false);
+		else
+			cec_phys_addr_invalidate(port->adap);
+	}
 }
 
 static void extron_process_received(struct extron_port *port, const char *data)
-- 
2.53.0

