Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.56.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002288;
	b=EXoiexUAfGexalqCUZI41NoEXRs6yU8PXv4/m2Wev7ZS1JSWqO9I3VLHZmn3xD4bcBMm
	 KFqI/Xtih/lPhpsUT5e5tl3FMtFNlJDD1n0hx3UlIUX7TTr3ji8Xd/s/vL2oXmZ0629xO
	 RVTsSoZKRh4UidfgSFGHvbfU0+5rvdwIzWqkzfFxsMuPftophk+S550ldk/pcWLmTUL7i
	 Xlo9z/JroDfIky7yzs98EHVzxmk5lXaflCQljBMOyaEvfzTg1BSKaEJb6+vtWxM/Pd7qt
	 5E6TxPOHs1h4dLYOIz3kpx9VKpHeDKOcist50AXjni+5k3yLfdOtvzEnGo4gjFQYjeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002288;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BDIRuxe0GFFz3EbDryoZgxmSdoxIdO1h/LCZGwLeUvE=;
	b=C993EcofbzsAPkW0zv3rHokzP5DQ9lPCd0fmweFir0Iq5R/U7gePxuO60PthxoUdiyKR
	 3bTJ0Pvrg1hBMssmVdJVdrKBYllz4EKojU7RjgQo2kp8tf+3MIWgkEgl2TdyKfWM8r/7v
	 PfYHq2ZAgl5CUFJhxqhZcTkKVFrZsqu1ArFNyt1GE1MvdlCbjiHXf48LlQ1o2qJ6Be9W7
	 XNarM77oIHu0fY8a4OiQloxNuZhMmbEG+7DXlFdFghBchr2wGRkdXftOCEa7ZCpNUSjjF
	 FDZ0YRbWStgBm9CrMOTgXGqxTDOlEWyYLC9kcGg0VhWzz4mQFemNzXzPz7ycDI1zl9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideco.ru;
	spf=pass smtp.mailfrom=ideco.ru;
	dkim=pass header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=cKCxnWBh;
	arc=none smtp.remote-ip=51.250.56.165
Received: from smtp.ideco.ru (smtp.ideco.ru [51.250.56.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECCB606A31C;
	Wed, 18 Nov 2026 11:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BECCB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ideco.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideco.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=cKCxnWBh
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id 5925026BC1;
	Wed, 18 Nov 2026 16:44:44 +0500 (+05)
Received: from laptop-ak.home (unknown [5.189.116.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id EA25E26BC0;
	Wed, 18 Nov 2026 16:44:41 +0500 (+05)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.ideco.ru EA25E26BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ideco.ru; s=ics;
	t=1795002283; bh=BDIRuxe0GFFz3EbDryoZgxmSdoxIdO1h/LCZGwLeUvE=;
	h=From:To:Cc:Subject:Date;
	b=cKCxnWBhOBU9UzTMvlQSagIR5z8nMLzwUb0Pn1r+Q8MUU1teyyqn1S0kAGG9ZIelr
	 F3ZENi+gqLKbnXkv3ZgSAM7ezasKweo6CmSKxVLknSS4KNWB+ey7Mek3FS4gGd8uaz
	 RqvYWGPHkVergpUIwnMNT3IaMGIwDiq0kgPr0K8nKZmV7GKCvalxIBoS3MCjDFBCuU
	 KQzuTdT4/uMl9Y0lP2CKovvmvtoo8L5UPq/ZfNYLtxFoWam8XfBEic+6/NoyD008cX
	 Eff3KoR6+fF03U3cF0FxBFl5z9PyNqL380vMjbamCYIf58BjvrUdiDZQo/Pdjh8FVm
	 /ZA1eESCbxL1Q==
From: Andrey Karelin <a.karelin@ideco.ru>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andrey Karelin <a.karelin@ideco.ru>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH RESEND] media: atomisp: remove dead error check in ia_css_stream_create()
Date: Wed, 18 Nov 2026 16:44:22 +0500
Message-ID: <20261118114425.203120-1-a.karelin@ideco.ru>
X-Mailer: git-send-email 2.56.1
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

In ia_css_stream_create() the return value of
sh_css_pipe_get_viewfinder_frame_info() is not assigned to err, so the
"if (err) goto ERR;" that follows only re-tests the result of
sh_css_pipe_get_grid_info(), which has already been checked, and is
always false.

Propagating the error instead is not an option:
sh_css_pipe_get_viewfinder_frame_info() returns -EINVAL for capture
pipes in RAW and BAYER capture modes, which have no viewfinder output,
and atomisp_set_fmt_to_isp() selects IA_CSS_CAPTURE_MODE_RAW when a RAW
format is requested in capture run mode, so stream creation would start
failing for such configurations.

Remove the dead check.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Andrey Karelin <a.karelin@ideco.ru>
---
Resending the patch unchanged, only rebased onto current mainline. The
original posting got no response, probably because it went out
right before the v7.4 merge window:
https://lore.kernel.org/all/20261016105553.346322-1-a.karelin@ideco.ru/

 drivers/staging/media/atomisp/pci/sh_css.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 4a182dc384ca..6f8cec1f1d87 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -8120,8 +8120,6 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 				sh_css_pipe_get_viewfinder_frame_info(curr_pipe,
 								      &pipe_info->vf_output_info[j],
 								      j);
-				if (err)
-					goto ERR;
 			}
 		}
 

base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
-- 
2.56.1


