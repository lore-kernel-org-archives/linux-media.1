Received: from mail-qk2-f4.google.com (mail-qk2-f4.google.com [74.125.230.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8508B3B14AF
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 22:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769259; cv=none; b=CgQD0ZZhX251+hv523i4uBAjhCqBACfvFPYVLIlbmEj0OMF00qZUt8ZdOivIoS5J9LZkycpNxc4KKk8diPIjHwq0hOp9Ltu+XnjBF1lEQAhXjdCPAsOY2l4/7Z+EhRNZY/Ku6COVNjhMI3PaJ+TNj5YpOMP0D22yKw8bqJLPvZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769259; c=relaxed/simple;
	bh=HgX93KE0MQc0823UjkBmjKAJZP3kkU3/phlZFmnyrO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D3fm2O5XLhqpbw0Oj+Fu+/f/g6I//d7tlTvyfskw8yzOw+aEOdTEIZZC72oxFDAI5iZoy6xN9Yz8tE2k677Us1rn5xStU6ZQjrqHaVBTsqcqOFZ/9JYzdNs+Fdw8EVZ09vbTGh9VNEN5savmB0wTy7gQZw54DSmcX785rxrBAlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/FlB1aS; arc=none smtp.client-ip=74.125.230.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/FlB1aS"
Received: by mail-qk2-f4.google.com with SMTP id d75a77b69052e-530e691bfc6so9435001cf.1
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 15:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789769256; x=1790374056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8SEg1P3oPQce7O0NRVRq+u7/Rlg08HjgzES4pssKWg=;
        b=E/FlB1aSaC72nFrnzlIGqKuZDD1m2SkxlECS6iNmzVrALWuWVKcSj2Uf+YNSIKXVwL
         NkqXgggDix5R5O28KfPpBfkHSspyylUWFcvDwLqoEQGK+r5rUsERGh+7AgFBLFBwTOif
         u30rEaZQA3taq6fHXhC44D6kMxX5C2ZKQ5Z4QyLFl7SFCrfjIwGI9NCcTSvzbzGJZucw
         SvpDHaZdC+bavqVF5GnDa5JciiwpclS9Bxib75TZUw10lt3CoI+J03OqoQLmaoCWr4lA
         559vscb0f04fw/P7qfcYw6RINqXzjkZLkVjqBinQQ/gxKCiJ5Ll7ue7p/4OH7nJkWpy2
         rUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789769256; x=1790374056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i8SEg1P3oPQce7O0NRVRq+u7/Rlg08HjgzES4pssKWg=;
        b=bD4S33f+D1/glB7gr4lE4QMFoliw92QG9JlElx9vUEmKwOxtjI30Xitg0yvMxghrtS
         l5j0ZeSxbhOjUgOC93VHVeF0v1wPtaoiPnqUgofRGhVHyX5Dq4ULzsKjNnebW4UpiPug
         1aklQeqDlRWY7cvfqMPG++lAFedd79ZuCKVPPQro7wnUpd2qYywhUHRUyk2ZVQQ6XUgN
         XymH/WaHguypJ8TIAtOcc07BstYUt/vC3B1zVBkj2DD4XxHWn7qn3pUHgUReAD2NU4eO
         +aY+EMCWomIevtPVLIVIqekqnrRNMPQG/NCychprW8NBwUT960QLriKvDIkhB1vr44bc
         ko5w==
X-Gm-Message-State: AFuF++mOfiMZMM8Wzv5WqhCEGeJJuEoA8Sw3JUGxsuPrZ6Q6d1HiskMZ
	OgAurBBc1hETE64DsNbHMGIrvQdn+iGCVt1U9z8DWOkxjFcGdr/nNQm3JIr3VRxLkpIWBw==
X-Gm-Gg: AYBFou0voc+xHrNWGmrJnx9yDxIb3TL1jHJcjtF4A+xso4LHpbTFZ1Tix9T4WW2Zi5v
	5qo8QvS/ShAeNegaY1B+H4Lva2GtFc98EI+rdGxrFRSkqizwfneMJrdgNiAeDWNEBqokO0m/enP
	vHI9B8yAOiTd7ntjGjuck2l8p0A5+3Wpgm1/4I1V3HFeqRKtk9wCVuoTsYlD/s4KMu/IvfgtpgK
	cLbZe318r7ioy6J/T3NNKosS/8bmtCtwqMxHlhVDMQ/6+hW8NGzrAA9Nhgduay7c8FtNiHkrJdC
	KcOTNQZKxuDm26vdOIkyXlFZ6g2Q9ltj/k5KF0C0Oh/vh/pOROT+6wKeMogRbylivee/3bdawDs
	W3fLfpCpSkMhI2OsAMBskeY+67+ysiojDHEveJj+Pbs9Ej8wxlgtP61ThixElVtsI1DOXu46pOr
	pP6hRMmsz17J04u+8C9fDJsLB4OROswS8dDXrESmZx8IHbXIygnqnjrbHS3AuLkaDsRJxBcc0F3
	KnvYuXtzW299FLRRVda5MJRU1SJ+02vvXC0njc5pKG5qw==
X-Received: by 2002:a05:6214:21c8:b0:912:5d56:e6a1 with SMTP id 6a1803df08f44-9125d56eb9bmr38233866d6.49.1789769256086;
        Fri, 18 Sep 2026 15:07:36 -0700 (PDT)
Received: from Interstice (pool-96-239-109-94.nycmny.fios.verizon.net. [96.239.109.94])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a33c2dsm6015856d6.13.2026.09.18.15.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:07:35 -0700 (PDT)
From: David Wood <d01.devel@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org
Subject: [PATCH v2] media: em28xx: add StarTech.com SVID2USB23 with working audio capture
Date: Fri, 18 Sep 2026 18:07:32 -0400
Message-ID: <20260918220732.2042033-1-d01.devel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913231013.30b18fcc@foz.lan>
References: <20260913231013.30b18fcc@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The StarTech.com SVID2USB23 is an EM2860 + TVP5150AM1 + EMP202 capture
dongle that ships with the generic eb1a:5051 USB ID, so it is picked up
as the EM2860/TVP5150 reference design. Video works, but analog audio
capture is silent: the ALSA device yields a flat noise floor of about
-85 dBFS whether or not anything is connected.

Audio on this board is not on the em28xx vendor path. Chip config
register 0x00 reads 0x50, so the board exposes a USB Audio Class
interface, claimed by snd-usb-audio, that is fed by the EMP202 ADC.
The ADC record source is selected by AC97_REC_SEL, which
em28xx_audio_analog_set() only programs when EM28XX_AOUT_PCM_IN is set
in the input's .aout. With .amux alone only the mixer volume registers
are written, and the record source stays at its reset value (Mic, not
wired on this board), so the ADC captures nothing.

Add a board entry for the SVID2USB23 with .aout selecting the PCM
record path from Line In, and identify the board by its EEPROM hash,
leaving the reference design entry untouched. Boards with this USB ID
that do not match a hash keep the reference design as before, without
any extra log output. card=114 also selects the entry by hand.

Verified on the SVID2USB23: the board is identified as card=114 and the
driver programs AC97_REC_SEL to 0x0404 on its own at probe. Toggling
that register alone with everything else held constant is what
separates working (-22 dBFS, line level) from silent (-85 dBFS)
capture. AC97_POWERDOWN reads 0x420d (ADC, analog and reference all
ready) throughout, so this is not a power or GPIO problem.

The V4L2 mute control still defaults to 1 and gates the bridge audio
path, so clearing it remains necessary to hear anything; that is a
separate issue.

Signed-off-by: David Wood <d01.devel@gmail.com>
---
v2:
 - board-specific entry, identified by EEPROM hash, instead of changing
   the reference design entry (Mauro)
 - .aout reduced to EM28XX_AOUT_PCM_IN | EM28XX_AOUT_PCM_LINE, the two
   bits that select the record source; EM28XX_AOUT_MASTER was only
   carried over from the old fallback and is not needed (Mauro)
 - real name in Signed-off-by (Mauro)
 - em28xx-cardlist.rst row

 .../admin-guide/media/em28xx-cardlist.rst     |  4 ++
 drivers/media/usb/em28xx/em28xx-cards.c       | 38 +++++++++++++++++++
 drivers/media/usb/em28xx/em28xx.h             |  1 +
 3 files changed, 43 insertions(+)

diff --git a/Documentation/admin-guide/media/em28xx-cardlist.rst b/Documentation/admin-guide/media/em28xx-cardlist.rst
index 741aa7f..df2595b 100644
--- a/Documentation/admin-guide/media/em28xx-cardlist.rst
+++ b/Documentation/admin-guide/media/em28xx-cardlist.rst
@@ -450,3 +450,7 @@ EM28xx cards list
      - StarTech SVID2USB232
      - em28281
      - eb1a:8286
+   * - 114
+     - StarTech.com SVID2USB23
+     - em2860
+     - eb1a:5051
diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index b7c534f..8440eaf 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -1194,6 +1194,28 @@ const struct em28xx_board em28xx_boards[] = {
 			.amux     = EM28XX_AMUX_LINE_IN,
 		} },
 	},
+	/*
+	 * eb1a:5051 StarTech.com SVID2USB23
+	 * Ships with the generic EM2860/TVP5150 reference design USB ID and
+	 * is told apart by EEPROM hash. Audio leaves over a USB Audio Class
+	 * endpoint fed by the EMP202 ADC, so the record source must be set.
+	 */
+	[EM2860_BOARD_STARTECH_SVID2USB23] = {
+		.name          = "StarTech.com SVID2USB23",
+		.tuner_type    = TUNER_ABSENT,	/* Capture only device */
+		.decoder       = EM28XX_TVP5150,
+		.input         = { {
+			.type     = EM28XX_VMUX_COMPOSITE,
+			.vmux     = TVP5150_COMPOSITE1,
+			.amux     = EM28XX_AMUX_LINE_IN,
+			.aout     = EM28XX_AOUT_PCM_IN | EM28XX_AOUT_PCM_LINE,
+		}, {
+			.type     = EM28XX_VMUX_SVIDEO,
+			.vmux     = TVP5150_SVIDEO,
+			.amux     = EM28XX_AMUX_LINE_IN,
+			.aout     = EM28XX_AOUT_PCM_IN | EM28XX_AOUT_PCM_LINE,
+		} },
+	},
 	[EM2861_BOARD_PLEXTOR_PX_TV100U] = {
 		.name         = "Plextor ConvertX PX-TV100U",
 		.tuner_type   = TUNER_TNF_5335MF,
@@ -3093,6 +3115,7 @@ static const struct em28xx_hash_table em28xx_eeprom_hash[] = {
 	{0x4e913442, EM2882_BOARD_DIKOM_DK300, TUNER_XC2028},
 	{0x85dd871e, EM2882_BOARD_ZOLID_HYBRID_TV_STICK, TUNER_XC2028},
 	{0x8f597549, EM2860_BOARD_MYGICA_UTV3, TUNER_TENA_TNF_931D_DFDR1},
+	{0x11b79572, EM2860_BOARD_STARTECH_SVID2USB23, TUNER_ABSENT},
 };
 
 /* I2C devicelist hash table for devices with generic USB IDs */
@@ -3457,6 +3480,21 @@ static void em28xx_card_setup(struct em28xx *dev)
 			em28xx_pre_card_setup(dev);
 		}
 		break;
+	case EM2860_BOARD_TVP5150_REFERENCE_DESIGN:
+		/*
+		 * Retail boards shipping with the generic eb1a:5051 USB ID
+		 * land here. Pick out the ones that need a board-specific
+		 * setup by EEPROM hash; the rest keep the reference design.
+		 */
+		for (i = 0; i < ARRAY_SIZE(em28xx_eeprom_hash); i++) {
+			if (dev->hash == em28xx_eeprom_hash[i].hash) {
+				dev->model = em28xx_eeprom_hash[i].model;
+				dev->tuner_type = em28xx_eeprom_hash[i].tuner;
+				break;
+			}
+		}
+		em28xx_set_model(dev);
+		break;
 	default:
 		em28xx_set_model(dev);
 	}
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index 8eee639..c916b15 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -162,6 +162,7 @@
 /* Params for validated field */
 #define EM28XX_BOARD_NOT_VALIDATED 1
 #define EM28XX_BOARD_VALIDATED	   0
+#define EM2860_BOARD_STARTECH_SVID2USB23          114
 
 /* Params for em28xx_cmd() audio */
 #define EM28XX_START_AUDIO      1
