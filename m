Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799456;
	b=ss22gXsDx7Zkzy3ZQA7zona3fcgt51SO+AUi+CZM7SkFmyAp9D77DezIErcJOU+Nqe8/
	 ncUJf4Tti0nGcXqaltwP85LREOt7t8gOCVBfoT7/hkLTtYRepQT1F0COljT9W8WB6WAr1
	 ZcqAg8aIUc84GSdZ1g1++mkoDP+t3xYZnCQczp/jrJtxJTVHNfFVMkTwtto73r9pAKYpX
	 gxTvnh0RsshSdl1EaWg1x4ehsBqFz4itfkIHfeiyTPgq+BJsuHNbtNN4XQpU063HUXHX/
	 360pC7NffB2mQi0799yDIRyvIJE7UGmEjGQCexY9h0Oi1YAZ1NBB0wIiwyXw5X8Q6ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qVyZ5JXcEl3tXOY2kifGRQjU/l0/QT+5WnCDaqGFEpk=;
	b=DeIwyLisLLaI6Kf9juMWgDauWhaLQDW5oeo5thW7XhzTnJq029kDRPwNcmUMqpv8vbOY
	 Yq5opQNzP7JvIqF8zlvZdRg3kqCwmaQE14j6j789aW1oGS6BN6J6ouJD79FlkF9KEhnH7
	 7htWpH0wb427fyZ/GopBXW+6Yk76Fy/LbYZvHGIL+RtJ9no8U4cBHwCeFQS/Aij++jidG
	 XY3ySR47cApNgE7xXxjQaFRoYlqTnuT0xK3AD1c/CG2LfqY3NFvaRjciqZdYacoL60JEY
	 XIYG1vqb90a3Sb4lCKlGzenN3RmGl9Bxv8fJX4UAgKrrbScrhlWIjrq533ac5UI/skg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SVGu2pSs;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69839606A31C
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 17:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69839606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SVGu2pSs
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so4586778f8f.0
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 09:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795799455; x=1796404255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qVyZ5JXcEl3tXOY2kifGRQjU/l0/QT+5WnCDaqGFEpk=;
        b=SVGu2pSstSlqKbUooT8DocgzJ0719S6kRkXdoPY5SJibKxibuAENuwa1t33yRXmKe/
         cbcaZCURuYCO24kb6xOHz9DiHu9shAeKeTnv6XzyntTdU/gnvhudhGWeErGcLiLGtWV2
         6QWq7Z9iwYs7W345TWI/8vcDXciHoFZz8FE6IYf+WHiA55BWzGU4lK3v9YotmhaIQvHN
         3XWX7iMB1JsIcnnFaiOcG8GEvS+fXt+UO77pyXWVBFq/hjAS4fh2tEG+afOb+P9y7W9f
         LPofB9/JOXid7unfqn/SAoL2kOty+qlqep556Q8vnkYBF/ge4YwLC+uSwPuRKikUnmUK
         pkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799455; x=1796404255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qVyZ5JXcEl3tXOY2kifGRQjU/l0/QT+5WnCDaqGFEpk=;
        b=vbTB5zsKay7tkfaobGZmtFg7bsu8q6mcPk1GIFVdvZ8si+M7Fx+xRw+F6BBxDmf8Rx
         AkLR38ULsdNWJcN4u5IO4SpcmHIeCPutL3j1a6fEhhK2aNwLEBNTz+O69cn86bkceqGb
         Qbfe8WhO0cUaygxWB+g0+j1M0uzQn9gAE+Hrtqn0tPxdd2Mr4mKNHV6FgZDDvofFRqZ6
         m2ytkmdG3t4t76liY3iMMeEpwswgwbjkieQW+iEkCTTvTDVYc1s2p3R+4N2xyY2zgD1w
         x2TS9x+ZYPaTu74mWNZvVD95myFcYyd/5nSe58pwaLdJiqH3BrzJ8cjkIuOLTDz5wf3O
         70Hg==
X-Gm-Message-State: APuU4Z/hAXenZ8Q8TNdG3FlIAGlwxd/52Vg8ToUEQe5jNPtW5PonOT4L
	WyXzzc/7D5MOwY06PVox8ezx3YLMQ0ndI2u2tG+LZCEiEyEKwcWA7++dlB02eXIZ9KA=
X-Gm-Gg: AZFdTZfVXdBuCoWMRcjkD6Epvg5kAA2mYODWoL1htPRnrO7wB1x3Y/FC/q+w8tVEzGb
	VvSXwjmyffSx/3OgKzV4TpA8mqStGcs8JRw1W0ZO6upwO+FqmYY4EUy3EtWw4tWy9DjeCxXdeX7
	MbJxEaW66l2gMvDfs/MUGFdnqHyYg5r6b3tbe4G2tU0eYLwb+1Y+s7kWRi3hj7tKUOSX0AH5jIb
	khGmQ3ln9Y4E+7ouy3GUeHkqbMN+xSI+ITnS9oYZ5yThQfSVZRvmIdDXB1Gjbg3UaqhcHQi3z2a
	lNiucIBoWNWjiuxynwS/5PLquyvCWytyoJmKRTm3XWdWz5mWt8Pb+ZPOE3aPbtI4TJjeC/k+PiP
	m9kQh+7xZK3G+lscjsLtut0mRikegjvWk8wvyZClJGq3fNjClt4JjwUVX+GRUXg6/RIKlXdjmHS
	HiBE6/VQwSOIyZ+HarA+ew7TdEgxS/yW38klBklKMAMtmacQO8lnsqdZ/u/MzaCuWUeB3GbeUx9
	XPT2sLeBB6B+69NGausHS7duz1f1oCpXRmX+kW9ktWMRwFFqjwdjZZ4qq6/Hkk9hJA6/wrmWlsJ
	CqXkzcvWTlPWHFmsTWUy0xk7X/lOvtTz
X-Received: by 2002:a05:6000:2990:20b0:4aa:2afc:e63b with SMTP id ffacd0b85a97d-4abb400bb25mr38021422f8f.36.1795799454628;
        Fri, 27 Nov 2026 09:10:54 -0800 (PST)
Received: from archlinux ([2a01:e0a:af5:1600:92e9:6094:382b:aa1f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm48489589f8f.42.2026.11.27.09.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:10:54 -0800 (PST)
From: Laurent Tramoy <laurenttramoy@gmail.com>
To: linux-media@vger.kernel.org
Cc: Laurent Tramoy <laurenttramoy@gmail.com>,
	Sean Young <sean@mess.org>
Subject: [PATCH v4l-utils] ir-ctl: fix UNSET sentinel checks for send carrier
Date: Fri, 27 Nov 2026 18:10:50 +0100
Message-ID: <20261127171051.1500269-1-laurenttramoy@gmail.com>
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

struct send::carrier uses UNSET (UINT32_MAX) to mean "not specified".
Two checks compare against the wrong sentinel instead:

- read_file_pulse_space() tests "if (f->carrier)" instead of
  "!= UNSET", so it always treats carrier as already set and never
  applies the carrier implied by the scancode's protocol.

- convert_keycode() defaults a missing keymap carrier to 0 instead of
  UNSET, so lirc_send() treats it as an explicit 0 Hz and reprograms
  the hardware carrier to 0, silently breaking transmission.

Compare against UNSET in both places, like the existing "carrier"
keyword branch already does.

Signed-off-by: Laurent Tramoy <laurenttramoy@gmail.com>
---
Hi,

This is the first patch I submit through email. I hit this while
testing IR transmission, happy to adjust anything about the patch
if needed.

Thanks,
Laurent

 utils/ir-ctl/ir-ctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index d2ff77e4..63aaa803 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -296,7 +296,7 @@ static struct send *read_file_pulse_space(struct arguments *args, const char *fn
 			}
 
 			carrier = protocol_carrier(proto);
-			if (f->carrier && f->carrier != carrier)
+			if (f->carrier != UNSET && f->carrier != carrier)
 				fprintf(stderr, _("error: %s:%d: carrier already specified\n"), fname, lineno);
 			else
 				f->carrier = carrier;
@@ -756,7 +756,7 @@ static struct send* convert_keycode(struct keymap *map, const char *keycode)
 				s->len = re->raw_length;
 				memcpy(s->buf, re->raw, s->len * sizeof(int));
 				s->ty = SEND_RAW;
-				s->carrier = keymap_param(map, "carrier", 0);
+				s->carrier = keymap_param(map, "carrier", UNSET);
 				s->next = NULL;
 			}
 		}
@@ -788,7 +788,7 @@ static struct send* convert_keycode(struct keymap *map, const char *keycode)
 				s->len = length;
 				memcpy(s->buf, buf, length * sizeof(int));
 				s->ty = SEND_RAW;
-				s->carrier = keymap_param(map, "carrier", 0);
+				s->carrier = keymap_param(map, "carrier", UNSET);
 				s->next = NULL;
 			} else {
 				fprintf(stderr, _("error: protocol '%s' not supported\n"), proto_str);
-- 
2.56.1

