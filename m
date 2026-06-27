Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FF5390C8A
	for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 06:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782543341; cv=none; b=S9PQSZtCyu+y00gzi2Ex2zm4j1PFK7DiK6S0iKgxILj12Z8huZFIJEhXvRq8e4UBJcebz1BDaYKfzkkaQYuXKeKL2JMDwe3KAvFL4w404xgMpnSu4MSZLcRHm7RiQbzUbHBOUjP70AJ9o3wnkXORh08zoYZghX3N0+qzSLHjeVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782543341; c=relaxed/simple;
	bh=/9Jmmg7n/1wL8dwr1mXSnzfdn3ik6xwgtLV28dDJ2H0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0Bbu1qYrVn1t+ePGMJcJh0nyAiZIDZGqYhogZwdPWWOw74aFNfO8PiFHVJLT2R5glqlYfk5NZKrp2d1sSDEs3FqhAo6ho6yc+sO/Wi5S7DKnyVT4hon7YV01xvIA3qSNQt62lc9l5Wqh/ofYoKxQEVzgUazEIe6BxDTscG4H/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=xIj/0eGN; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="xIj/0eGN"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-46f27bd4c45so1199011f8f.2
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 23:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782543339; x=1783148139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SY5IObv1DsntvWInFkK4gkjbbOppwkuoQ6M12vyKR9M=;
        b=xIj/0eGNtchMBvki1kdATb4IZlw0KXbasduN37KmfLWWPYE+rYzWu0SyVN2bZNsg8o
         K1NgvQau9OImGo8s9bzZOP0Sr7+itv/9no2SVUDIf+Vg3MJ01OQb5WY5B6143dvO45ps
         5viXeb2tYkA4nUqQQkFMhdOj5fgnK3LLHBfUG1t/hIsgWf7oqgSIMFyBfAVXumIK13hU
         MPFYOpCTdUs32iod0+ZNu/h28DC57qmy2JqmPyMbT493W9oo8uISJflqvKGTXqXBIFaE
         k1+YSJy+aUQevGaOzTTqmTg8IRl1jYeKbmRISVnKcMZkmxRh+tYYP/5XiUoTaxz0ezkf
         pCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782543339; x=1783148139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SY5IObv1DsntvWInFkK4gkjbbOppwkuoQ6M12vyKR9M=;
        b=Lv24K2yOmBOsnmwJtiWuWtGNEcW+C94fHoqQvJaIfpRrVlm6NMmj8IXTnXjPph7IZs
         B2vzw9W5CdwqTijizbwDkwRiumpHvNrSr3dVgWoxIcdlT4klofEAXqR/R75nnLjY+6CA
         /gvOhdoAtzTp8tIceox9q+dwIeERYCRZR6T/RhUGLavLddBs8pKblXIyNFqjxMfrehgd
         goEazyT6sjaJghUhSCOTuGpGnmfVofvUR56T9trgTz+WG3VTBmdo253SnYMsXXVVro72
         M11ksLkSOYyRHKwUtMxlu8kQlNDSh6EvraEIh7XQxyS+3GoUwtdvnXRBenZgCP3t0X40
         w4kg==
X-Forwarded-Encrypted: i=1; AHgh+RqHMtP3YUXiR41RCFGPIWeDofADOjBmh2wQKMJvnJYDRV87OUcaX8ee3HOtjfTt2hH0sGPrH7jDsYKDyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXoROlvwUhLJqUGyyVk1/OMfp92sR09NhntNJiv1hShi5GCUrd
	6PcTKb42TnqX1IwHroOtLoSwkhJzLMdB2z3gtJ/T+aFrHY8AY5+SrzGJ/NZCOmQKWv0/
X-Gm-Gg: AfdE7ck2sd2uF7jdbXgSa6RkBMjlFAPY/ZO4cdz6CPgt+FeUC2CWXksqBvpeJCT2zza
	5OntFy0iiDPl6pjII+s4W2xr/gg0xrvOQKIzTG5oupdLqlQdke6KhdVUOjIjbFnKFrOqe0iqTwP
	BZHDEjkF1Yzmk377CaWCvuM78X7jatkWtum32OvH1Un2GypXI03TayHfb7KTIG/KYXrMLHojRdB
	6xQ7uny8aJlGQ5fpNKAK9sErSIB3ujdWCPtGvCZ5zUi155wAwO1WhcU5Jv4VoZ8+f5ipjSzp6a2
	oxnrAwQHFs700F8R+NvBzhZF4ocve1c3AYQ0qsg20cMi4VtTZikpP+o48h6R14Ixd4xgOgNIung
	Hn4s+tC9MxOtVqmsWp/dioUeLMi08jXvljfQPNhyXsZm2+mw9kzeCHcS8PoNJyID/Nmr2s6RfHA
	pbe7oBPswfCRhSKKsSCGZ6eIIfgpi2jV2B1p42pAolnuWW3jeTeEMyFQSewnYDD4mANIw/eZgUb
	TiFl7dnuVOfORlmRGgkLWDt/Nmhvb7LV68=
X-Received: by 2002:a05:6000:4204:b0:460:30bd:4dca with SMTP id ffacd0b85a97d-46dc12e056fmr15051536f8f.30.1782543338095;
        Fri, 26 Jun 2026 23:55:38 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee0189esm32691380f8f.9.2026.06.26.23.55.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:55:37 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH 1/2] media: meson: vdec: clear stale prev_frame/cur_frame on flush
Date: Sat, 27 Jun 2026 08:55:33 +0200
Message-ID: <20260627065534.88527-2-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627065534.88527-1-doruk@0sec.ai>
References: <20260627065534.88527-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codec_vp9_flush_output() (the .drain callback) walks ref_frames_list
and kfree()s every vp9_frame node, but never clears vp9->prev_frame
or vp9->cur_frame, which alias nodes that were just freed.

If decoding resumes after a flush with an inter (non-key) frame,
codec_vp9_process_frame() calls codec_vp9_set_mpred_mv(), which
dereferences vp9->prev_frame->{width,height,intra_only,show,type}
and feeds vp9->prev_frame to codec_vp9_get_frame_mv_paddr(). With
prev_frame still pointing at freed memory this is a use-after-free.

Clear both cached pointers once the list has been freed so a resumed
decode starts from a clean state.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Amlogic Meson
hardware required).

Fixes: 00c43088aa68 ("media: meson: vdec: add VP9 decoder support")
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/meson/vdec/codec_vp9.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index 8e80ecf84193..5ca27930239f 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -681,6 +681,16 @@ static void codec_vp9_flush_output(struct amvdec_session *sess)
 		list_del(&tmp->list);
 		kfree(tmp);
 	}
+
+	/*
+	 * All ref_frames_list nodes have been freed above. Drop the cached
+	 * pointers so a decode resuming after the flush (e.g. an inter frame
+	 * following a drain) cannot dereference freed vp9_frame memory in
+	 * codec_vp9_set_mpred_mv().
+	 */
+	vp9->prev_frame = NULL;
+	vp9->cur_frame = NULL;
+
 	mutex_unlock(&vp9->lock);
 }
 
-- 
2.53.0

