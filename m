Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971667;
	b=blJ0mst/8mmFexTJK6s2+hiygA7+smY2opn6Kl8Te3U9YXIFRiXqPkeBjQfoe6dXkVtQ
	 N75FJneh08xuDXTtoArpPImEUR61a3fVQ2SQxowu4D+kik11H0tSILKP66sPKCW0VYH9y
	 VmhOd8QrODCqNkXY+aKwPRbqgX6y5I+IqwePxMZL4eyv9c4lBvuhinLjLY0LI/0MEqsiI
	 WQtijcbEiPU8SQ1i21F64RSIebzKWA0/gBD9Zv9GRPQIzFxDSEPLYcGQdkQbucIb+mlyi
	 +tAFvzUa8ySASNB6WOaG6mJBybLauAI9+AlpKkTywDhJIuCK3aqTktGy+5nz6E9zwlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4qzmagwUsifibZiZHUOIZKECRLSgEbOIU+GnWPGOoMM=;
	b=jvH07wL9I5H+7cRm8bGjqj2XRc8TjrzyPAiFVmbVY9kufwFNJD8lgngz33RicB3gu9SC
	 4Ej/3l5TzoHayHTtcb9UAPXj459pFYtTj2YSDES09UPVpPPDCLB8zU4k4UNwvuDFbDhUh
	 wyoSdwyoWZm6/R5wQ4oluCiKoRWUESaMuyjP7L8BG9Wvy4/Ui9A0uJ//MQVpqdYz0fakH
	 UVdWlpifvZn3CGkdlOZRMTv3MDH7FwFiEYFQrTGBmtriTYkEPkm54s+aQT7qDH51MQOgo
	 QLH+vuOB065U4KO7+bsVs0G12kA4B5xsW1A52QDGYFSrzTR4W3QCI/1BiicMiX6DEqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FG1O2Noa;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59538606A32D
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 13:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59538606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FG1O2Noa
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so340017f8f.3
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 05:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971665; x=1794576465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4qzmagwUsifibZiZHUOIZKECRLSgEbOIU+GnWPGOoMM=;
        b=FG1O2Noabkh8lbZst620iOY65+N2ovjDMxS4vU8qduLdffcyHgi9VgmIkUep4JrP9V
         Y8vE3yP7JUa5NdKx8LYiTsaQ6sozQhXS13pY1cas16Xe3hHwaIxSO1LAkdrbRfuBEgS/
         aF5xGwSO4FmGiP0IMt/M7HNIpJYRVlhmAZs7MsnWBlbxIdewt0TUhYjJASWFZcatOhCp
         6ipsIiQk4mXlS2JARlKgvTFih+l5Tx1sm/2Ir7Y49+RASrtfou/hr6TwCRAkxGnWFNIG
         GhOVWcHGR3llH32K6Vya875vxN82FLfMvXozd0ZKYH/lcqVRGxUX4jjbEnvfh5UX7B0L
         qmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971665; x=1794576465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qzmagwUsifibZiZHUOIZKECRLSgEbOIU+GnWPGOoMM=;
        b=Q72I02zbfeesoxm4NUrXXeIbJVPLD1X5t1V+T+lZPx+tXm37075xOUGrwz2n52c5Ub
         0L+1TKlDQOlHkVGQm2C2F9bp7+B+Z8jUDbRzDRQFEhc6fWyHc/IgNudKr+Ah+M2W6YAB
         +MIJ2KQOeWRG070+MW6oeuSbjEubonA6hrQwok/+iZxmeIN7P5jqmoLAV/cVesd1pCeR
         rEazvDbOPNR8tSK1PF2CmySz/COfuKdhfIClRtamhyH/yzMiN0m7eCFp9Xfxd2rm3ZmS
         f88jNoTxiRSoCOGOrV3tUAi7eqTT9ImqQoDlpEnpbHGQhAZpltX89bG5WHm1+56uc0T2
         57dg==
X-Forwarded-Encrypted: i=1; AL+hErE4huNGofjAY3Jfdbgd2kXBGlEDQE4NZe4XDB50ZttfX5iMFTKK0fFJo0Lfr13JagEL0HPFT5TKL8H58g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/wfXMNa1zlLtRuPhaGRhaQVsyrVsV/MRevLeklxG215U5DGD/O
	zmhMT8IWH2dtbDtPaIRxyv8VFpURsFe3u1ufA1X/tDguvaUYgVmlkydo
X-Gm-Gg: AYBFou0jBzkb+/NMpYQRKkz1h8tyd/vxyKdICh0jlAWFvbZADVVoThOAqOVQS+eCfQI
	wkvonbQ8WdyZDXj62hp4ZQdgfcesPtFzt8BYRPlZkjjHK51OQP0mB/HRE2KABWgH6OpOJ01iEr/
	L69v8aS1PTi91p+c138EY53hdyvVWoxXudrg4SsajZZvN+1vxNez0oQcoPBz8gt5t7N3zJVuwyq
	kySYYxyr/aBmamqfxG8Sgl5y4u6SLxoM83SANUd//dKLQGPBZeUC6AJXQz+99uAK0tYtyNNlx3f
	qAURRooN4rO08zXTprQlOYGGXkkrnX7trKOMngQ4YF5wJ/wk07E9lcajkirWfjPVp9tnYO+cuje
	4vqdc8fX6wzYrpJja0XiZjBePbPOkTXjFD2clCDuoREJILVHUPU04EOCdwdZhAvy4oAnPTMvfHW
	fVood4cvNS6uEaJM9AnKPGQ9IIRbz1PQ2NoG+IL7YvAwJBnim9py7wepusVsVaMW08vhsKUwzCf
	ue1C8VvwjNCLgAUdIhPhmNFV7e0C4zgdAw6ysMtDRurzd+f+S9lJ4+jpZndal4p/PZ3rCqCQLRp
	v7Dyz+YRvHzzpMSz5ijLtXt8PTeK
X-Received: by 2002:a05:6000:240a:b0:493:1004:96f7 with SMTP id ffacd0b85a97d-49310049976mr3258508f8f.54.1793971664393;
        Fri, 06 Nov 2026 05:27:44 -0800 (PST)
Received: from salem.. ([141.85.144.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723310fsm3825733f8f.32.2026.11.06.05.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:27:44 -0800 (PST)
From: Lorena Tanase <tanaselorena3@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	matt@mattwardle.net,
	Lorena Tanase <tanaselorena3@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: Fix double blank line
Date: Fri,  6 Nov 2026 15:27:36 +0200
Message-ID: <20261106132736.32837-1-tanaselorena3@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Removed blank line to ensure linux kernel coding style. Found using
checkpatch.pl script.

Signed-off-by: Lorena Tanase <tanaselorena3@gmail.com>
---
Changes since v1: removed Cc line as suggested Andy Shevchenko
 .../media/atomisp/pci/hive_isp_css_common/host/input_system.c    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 68b0ad27615d..66311ab4880a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -6,7 +6,6 @@
 
 #include "system_global.h"
 
-
 #include "input_system.h"
 #include <type_support.h>
 #include "gp_device.h"
-- 
2.43.0

