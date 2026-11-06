Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793972046;
	b=zg0RHYFnVNH8hd+SP0nSDnt6rDUc8L6lSTloKE6Iov9mwSRfKKmvD7I5H6Adzom47qH5
	 LRVg1hW0s+6SZaoUV8HdOOdHJAOl+3BNSBOf0oa0NLSjLEPJ5YiYXk8YMiPOlIwLUtBIK
	 5YRZZ9fxmKzLcpQLtWvDyYi6mOD8qBoNr2EfyvDZPgiXJOdpAhgyL7mY5eXUSfDgcpP83
	 wM3emRd3qV8ructIje7tFl+xchzl6EwzCg1AdzKIWT9AQeIKyzH9mG1yYxYqmgBJiBEEl
	 o1iVQZjTy1+uZLb8OrY3FC9qWNlL1YKW5jnpD6C+Q9LP+gdZlS8lhPP/J6QnK+Pn8Aw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=EC/pgNsz4zDY51bd8J4peDyLwuTu+wZl1XXKGvBE7B4=;
	b=MniR4erMz5+JRLFjXgP+aMeBQOG+oYPjPXYS4tmqhgzBziJU2KhGujO7O6S+ikZfbU5w
	 dCGUXydHRjzUa79qdimfVaj7JlmHx/dBowzPW+6IDWtLWxo1vuwAIhMC4ZFCjWdomVnYA
	 jEY3vPwatbXylR/myld3S5J8V85HIXSrnOhbECVqxEkaJlSCfNn8LR37nyD9XGrDIpLFw
	 nKj8jxpwd4JXavt76pk4QMwcOaLjrUvhAXIukOa3a8QqTbCV27P5cNE/EkhWhOmbn636s
	 lbsnhmyuJzN7WwFjkpOda1rak8qDZ9i1bAR/P55aWPC2QreNIzMciHNl6taD53GVf4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0vMccpLT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CFE606A335
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 13:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21CFE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0vMccpLT
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b300713befso4262427b3.1
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 05:34:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793972045; cv=none;
        d=google.com; s=arc-20260327;
        b=Zf047mt3uNmgJXa/68bEOsyf2CsfzPnGPBk2lC+5bznArLpOl4lxsdA3ugVmKJHH/w
         +4wGe9Y9nE4oUNbAGfPdBJurqIUD0ewsOAkhDpQiCpwzsRKwEo6eEZn74/rkrbZ3Gdr+
         sWbrwvbgFypmDSwRdlg5OWHC2tMrTOEmqAjAslyxdcubk8StD1/vn7xz3WBW2WDxpYhm
         yPn1ztIAEijgvP0HDi9r1BOKrYojGy/3VuTfR+J6bvYNY1pbkos9ymiQ7JTi/uhyqB+N
         MZL+FxR8b9UQhahoIm2XFQ86EwJivkKjKfBp+8yTZ3ar1/hfq5mJmaqJ9Nl2O6TiGx9L
         wIQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=EC/pgNsz4zDY51bd8J4peDyLwuTu+wZl1XXKGvBE7B4=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=CnYs/+uUxnMbFfkpxd2tUtF7Wp2z4ZRs2iGQkI+gaCmJ9JGAzShmwn4XOjWqW7kD2i
         BZr9WvjlmMOWgsPXLDOhBxjWLzh00VjPdkflyms1ZyFM/LsWJPA0nkabLqFHfL64CtsZ
         N2PxY2sVPGMmKkZJKpdVHZDUA3LmPVRHK1VxoeqWhyDpxFp9bGuGKi+57lLBDWUyJFY8
         xaYmq4PoKDObMAhTboH2MKFYi2Nxq1okvuu15kmcX4kiq+cE2SOClkTag9S5u9rH+BKA
         O0tpBVXjMa/1ZvsYrsa5YecywUMdA+YhqfWc8XeiaQNhzaEfS0u/NYphAMBi944EquRA
         L+lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793972045; x=1794576845; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EC/pgNsz4zDY51bd8J4peDyLwuTu+wZl1XXKGvBE7B4=;
        b=0vMccpLTPZCkhfIMFLq4TW+eM5iqU54tz7IXRg7rCUXYF9AJYCW1i0FC7DjHLD7O6o
         wBw0LPvo5a8d2zvx7yaOXvCZgtHFs+xxBOvkBpxiYkvwKiV8uPQ9IIjnFch00v6IFNhy
         Dg24XeVG1SEK0idRgOts0US34pHDQHyWjELM6eEheEhT349RQCgXeiVvI7ytXtHuM0ts
         A6+b+Tx22q6SSgwh1qaOqoD5sbXRyQkDZa4TVAe9nC/2YBaa58JR+NgrUVRyApP+5zNJ
         cSFRUZhfnYN9qRQXkC3fchlNKSSspYHqXurJd3SkPIAbGeXgTuGCQkjq9UsOaDxnjadR
         NJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972045; x=1794576845;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EC/pgNsz4zDY51bd8J4peDyLwuTu+wZl1XXKGvBE7B4=;
        b=F+CWEjDPme1giDfbnKu7plD0elJLtMMEdeuLzni0WVl8V4gHMOisJLaWJmhkp2dpfA
         aGoz/SNl64hXyfC4ryVUv4+E5E6J3LAK981O85I0FPx8Nz2TN9LCEh0r/FsbUzORy3ww
         gRBZ/9wtJjrNehjXMlK8Wc2fshUmedSBwPB4Xc25phpW4IM86BHQrw4B/UFJHnIzhkyV
         HaVQh1erNdBi01LhuMqWXwD8PgcL7k0xXjX9DStbPx/UN8fcudgj+HwzbeZiYjef0uZT
         TRAs9/px6/byMWHuFPdzviT/Us1AQgftjGLaFBIUWDw9QqvoD66NbhjrCKbntPynqKKz
         6r6g==
X-Gm-Message-State: APuU4Z9I/3hndxFEf/8FuaIjRNuzv2FCFwIA6nZQacPRHfGRRUB41NoX
	rw0LixQaQCO4Qwd59YDgHkuXkOgq9lmPAHYzB4fiiX6X6UnRa2d3dneJ/YYAyMKwzmfLHNIiDK1
	ZEe6t4hu+pZndQA87i7mY081/aE2oyqgngsg2KNEYkQ==
X-Gm-Gg: AYBFou1heLZjhExATAizocqH/bRxiOn4MpJNC9ZDyUiFqOjE2kO6Yk48oTqPeIU9LY9
	//cVgCFMsWtJhyjr88DYuh+NMnUedY0xbvxOtCwd0vaZhHi9aSoGia7NeGv2mS62r/KhqOK0TXw
	FmI3Ox2Ch5lGkcqcju52WrMx9LpFdYhO/jOFtWvHqRL4neFHlU47A+rfNDz0GuS/Gqc5ripJYp1
	EjnP7v9QKW7emIVLHkRiIu6u0VQXiISYTNIWwBdVJp5d7Ay0ecynbN+B/iU+GeX7luTwZqaRbaa
	D+ZePuS+varWi651UtFNuGAPVvcy7JPrWoETHnQ30s8KochJCV6y/rzU+5ebOWDKPDyNJBckkKH
	Np6ICdi4SBEH8Eini7H44G9dfUQhr/gF3z74IKYs=
X-Received: by 2002:a05:690c:9517:b0:8b3:3fc5:2be with SMTP id
 00721157ae682-8b341947d76mr10190407b3.20.1793972045063; Fri, 06 Nov 2026
 05:34:05 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Mehdi Fattahi <mah.fat@gmail.com>
Date: Fri, 6 Nov 2026 17:03:54 +0330
X-Gm-Features: AclHuK-t1ylW0SgDgHkiBCP6eTEFmAorcsR7hW6_w3wqfai-6n2atVavbj3dRas
Message-ID: <CAEE1uDcF9QThsv8JUuRYZJyBdx=KF=Y7=ZSzGtZ2L600j2qCDQ@mail.gmail.com>
Subject: [PATCH] dtv-scan-tables: dvb-t: update ir-Tehran mux list from live scan
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

Please update dvb-t/ir-Tehran in git://linuxtv.org/dtv-scan-tables.git.

The current file only lists 602 MHz and 650 MHz. A live DVB-T scan in
Tehran (Nov 2026, ONID 3622) found locks on six UHF muxes:

  482 MHz  - IRIB SD bundle (tsid 101)
  506 MHz  - NAMAYESH, OFOGH, TEHRAN HD, radios, ...
  530 MHz  - HD mux (TV1/2/3 HD, IRINN HD, ...)
  554 MHz  - PRESS TV, MOSTANAD HD, TAMASHA HD, ...
  602 MHz  - same services as 482 MHz (SFN / tsid 101)
  674 MHz  - IRIB UHD HDR

650 MHz did not lock and is removed. 482 MHz and 602 MHz both kept for
SFN coverage. Parameters follow the AUTO style used by dvb-t/ir-Kermanshah.

Verified with Tvheadend against a local tuner. Same change proposed to
the Tvheadend scan-tables fork:
  https://github.com/tvheadend/dtv-scan-tables/pull/177
  https://github.com/tvheadend/dtv-scan-tables/pull/178

Please apply the patch below (also as attachment if preferred).

Signed-off-by: Mehdi <mah.fat@gmail.com>

---
 dvb-t/ir-Tehran | 77 ++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 67 insertions(+), 10 deletions(-)

diff --git a/dvb-t/ir-Tehran b/dvb-t/ir-Tehran
index 9c28a776..7ae8ab47 100644
--- a/dvb-t/ir-Tehran
+++ b/dvb-t/ir-Tehran
@@ -1,25 +1,82 @@
 # DVB-T Tehran
-[IRIB-TV1/2/3/4/5, IRINN, AMOUZESH, QURAN-TV]
+# Verified 2026-11 against live reception (ONID 3622).
+# 482 MHz and 602 MHz carry the same TS (tsid 101); both kept for SFN coverage.
+# Removed obsolete 650 MHz mux from the previous table (no lock).
+
+#AMOOZESH, IRIB TV1/2/3/4, IRIB QURAN, IRINN, MOSTANAD, NASIM, OMID, POOYA
+[CHANNEL]
  DELIVERY_SYSTEM = DVBT
- FREQUENCY = 602000000
+ FREQUENCY = 482000000
+ BANDWIDTH_HZ = 8000000
+ CODE_RATE_HP = AUTO
+ CODE_RATE_LP = NONE
+ MODULATION = QAM/64
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
+ HIERARCHY = NONE
+ INVERSION = AUTO
+
+#IRINN 2 HD, NAMAYESH, OFOGH, SALAMAT, TAMASHA, TEHRAN HD, VARZESH,
iFILM, radios
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 506000000
+ BANDWIDTH_HZ = 8000000
+ CODE_RATE_HP = AUTO
+ CODE_RATE_LP = NONE
+ MODULATION = QAM/64
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
+ HIERARCHY = NONE
+ INVERSION = AUTO
+
+#IFILM HD, IRINN HD, NASIM HD, POOYA HD, TV1/2/3 HD, VARZESH HD
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 530000000
  BANDWIDTH_HZ = 8000000
- CODE_RATE_HP = 2/3
+ CODE_RATE_HP = AUTO
  CODE_RATE_LP = NONE
  MODULATION = QAM/64
- TRANSMISSION_MODE = 8K
- GUARD_INTERVAL = 1/8
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
  HIERARCHY = NONE
  INVERSION = AUTO

-[PRESS TV, AL-ALAM, AL-KOUSAR, JAAMEJAM 1, IRIB MOSTANAD, IRIB OSTANI]
+#ALKAWTHAR, MOSTANAD HD, NAMAYESH HD, OFOGH HD, OMID HD, PRESS TV,
QURAN HD, TAMASHA HD
+[CHANNEL]
  DELIVERY_SYSTEM = DVBT
- FREQUENCY = 650000000
+ FREQUENCY = 554000000
  BANDWIDTH_HZ = 8000000
- CODE_RATE_HP = 2/3
+ CODE_RATE_HP = AUTO
  CODE_RATE_LP = NONE
  MODULATION = QAM/64
- TRANSMISSION_MODE = 8K
- GUARD_INTERVAL = 1/8
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
  HIERARCHY = NONE
  INVERSION = AUTO

+#Same services as 482 MHz (SFN / tsid 101)
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 602000000
+ BANDWIDTH_HZ = 8000000
+ CODE_RATE_HP = AUTO
+ CODE_RATE_LP = NONE
+ MODULATION = QAM/64
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
+ HIERARCHY = NONE
+ INVERSION = AUTO
+
+#IRIB UHD HDR
+[CHANNEL]
+ DELIVERY_SYSTEM = DVBT
+ FREQUENCY = 674000000
+ BANDWIDTH_HZ = 8000000
+ CODE_RATE_HP = AUTO
+ CODE_RATE_LP = NONE
+ MODULATION = QAM/64
+ TRANSMISSION_MODE = AUTO
+ GUARD_INTERVAL = AUTO
+ HIERARCHY = NONE
+ INVERSION = AUTO
