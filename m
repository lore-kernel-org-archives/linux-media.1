Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19805331EB4
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 07:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148860; cv=none; b=GobsEzBgXltwj2xBbVebNxGNwKqniaep+4gyWkOvyb+XotSMt9hnAVuPOkG30IYn8fupWfCHL6+huuYkHamSFreSwNznPAFZk5kzdxFpdrd9SlXqaFwQWZdO8lcV3VH0E1raGx/2HNKNciWpTogra22kfn4vg20BdbyIGwd2NXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148860; c=relaxed/simple;
	bh=tj3U3hqoeO5HJXboiHf+xM7G9Uq60BIc6kN8b8PXAtU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Aj1IixhaDxjEys6eDO7zOTHzxLSAQr+gE5ojO2FQhp1I2ObETU18wrOQfqlrSA256zTohjvsOefTjqz/uwhC9B3JSwMTjoxH+8ovJEaXbhjJAAezrMZOv6Q1T/KWq/y30L9hepyfwK2lLDyyB68fYHZO1riSJ7Xm9QXKuvFiCVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwALJf72; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwALJf72"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD551F000FF;
	Wed, 23 Sep 2026 07:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790148857;
	bh=2J6sHBDEQVB8XgNcbm8aKlTGlxCLMxLDl/RRWCR+SIU=;
	h=Date:From:Subject:To:Cc;
	b=JwALJf72l0Kh1Zcy9xpmUO3IyOYn5yOxrNIzc9UQ8vDlHp1QGv7CXHLLuLcpaHN3M
	 03Va4lriauax6p2/Zy4jDXp3dajgT0tQWpfm1x6Luy3rbvbHoyNQC/oMbxxrcatYK6
	 aCjgQuKthwAJq3WC+p1QB8T3frKN67UZ6OvNgji4CTltSuQs4vH1vfAqgd9dFZY0kK
	 503EErckab/6tNvHinCyeP3bxVBlN+7QSQrmemSzP/viwRGvd92TYY+USc3+SdmuAE
	 3OqC3YDdzSvgDm/RLxXu73+yTjk8WNm5jHERGg1l1/NhN2M06Ex3ic3ajwn9b6i1lf
	 xvvz/U3NREHAw==
Message-ID: <ab26fad5-db13-41ac-99d2-d28f23af330e@kernel.org>
Date: Wed, 23 Sep 2026 09:34:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
Subject: [RFC PATCH] media: radio: drop radio ISA drivers
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

These drivers are for ISA radio receiver cards. I suspect I am the
only one who actually still has these cards and the equipment to test
them.

I think it is time to let these drivers go.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
This is an RFC for now. If we go ahead with this, then it will be for
kernel 7.5.
---
 .../admin-guide/media/radio-cardlist.rst      |  12 -
 .../driver-api/media/drivers/index.rst        |   1 -
 .../driver-api/media/drivers/radiotrack.rst   | 168 -----
 MAINTAINERS                                   |  48 --
 drivers/media/radio/Kconfig                   | 281 --------
 drivers/media/radio/Makefile                  |  13 -
 drivers/media/radio/radio-aimslab.c           | 195 -----
 drivers/media/radio/radio-aztech.c            | 161 -----
 drivers/media/radio/radio-cadet.c             | 679 ------------------
 drivers/media/radio/radio-gemtek.c            | 340 ---------
 drivers/media/radio/radio-isa.c               | 377 ----------
 drivers/media/radio/radio-isa.h               | 101 ---
 drivers/media/radio/radio-miropcm20.c         | 513 -------------
 drivers/media/radio/radio-rtrack2.c           | 142 ----
 drivers/media/radio/radio-sf16fmi.c           | 382 ----------
 drivers/media/radio/radio-sf16fmr2.c          | 345 ---------
 drivers/media/radio/radio-terratec.c          | 168 -----
 drivers/media/radio/radio-trust.c             | 243 -------
 drivers/media/radio/radio-typhoon.c           | 181 -----
 drivers/media/radio/radio-zoltrix.c           | 249 -------
 20 files changed, 4599 deletions(-)
 delete mode 100644 Documentation/driver-api/media/drivers/radiotrack.rst
 delete mode 100644 drivers/media/radio/radio-aimslab.c
 delete mode 100644 drivers/media/radio/radio-aztech.c
 delete mode 100644 drivers/media/radio/radio-cadet.c
 delete mode 100644 drivers/media/radio/radio-gemtek.c
 delete mode 100644 drivers/media/radio/radio-isa.c
 delete mode 100644 drivers/media/radio/radio-isa.h
 delete mode 100644 drivers/media/radio/radio-miropcm20.c
 delete mode 100644 drivers/media/radio/radio-rtrack2.c
 delete mode 100644 drivers/media/radio/radio-sf16fmi.c
 delete mode 100644 drivers/media/radio/radio-sf16fmr2.c
 delete mode 100644 drivers/media/radio/radio-terratec.c
 delete mode 100644 drivers/media/radio/radio-trust.c
 delete mode 100644 drivers/media/radio/radio-typhoon.c
 delete mode 100644 drivers/media/radio/radio-zoltrix.c

diff --git a/Documentation/admin-guide/media/radio-cardlist.rst b/Documentation/admin-guide/media/radio-cardlist.rst
index cec724256812..ed933b6415bc 100644
--- a/Documentation/admin-guide/media/radio-cardlist.rst
+++ b/Documentation/admin-guide/media/radio-cardlist.rst
@@ -10,29 +10,17 @@ transmitters:
 Driver                 Name
 =====================  =========================================================
 si4713                 Silicon Labs Si4713 FM Radio Transmitter
-radio-aztech           Aztech/Packard Bell Radio
-radio-cadet            ADS Cadet AM/FM Tuner
-radio-gemtek           GemTek Radio card (or compatible)
 radio-maxiradio        Guillemot MAXI Radio FM 2000 radio
-radio-miropcm20        miroSOUND PCM20 radio
-radio-aimslab          AIMSlab RadioTrack (aka RadioReveal)
-radio-rtrack2          AIMSlab RadioTrack II
 saa7706h               SAA7706H Car Radio DSP
-radio-sf16fmi          SF16-FMI/SF16-FMP/SF16-FMD Radio
-radio-sf16fmr2         SF16-FMR2/SF16-FMD2 Radio
 radio-shark            Griffin radioSHARK USB radio receiver
 shark2                 Griffin radioSHARK2 USB radio receiver
 radio-si470x-common    Silicon Labs Si470x FM Radio Receiver
 radio-si476x           Silicon Laboratories Si476x I2C FM Radio
 radio-tea5764          TEA5764 I2C FM radio
 tef6862                TEF6862 Car Radio Enhanced Selectivity Tuner
-radio-terratec         TerraTec ActiveRadio ISA Standalone
 radio-timb             Enable the Timberdale radio driver
-radio-trust            Trust FM radio card
-radio-typhoon          Typhoon Radio (a.k.a. EcoRadio)
 fm_drv                 ISA radio devices
 fm_drv                 ISA radio devices
-radio-zoltrix          Zoltrix Radio
 dsbr100                D-Link/GemTek USB FM radio
 radio-keene            Keene FM Transmitter USB
 radio-ma901            Masterkit MA901 USB FM radio
diff --git a/Documentation/driver-api/media/drivers/index.rst b/Documentation/driver-api/media/drivers/index.rst
index 7f6f3dcd5c90..c9b2727c5d55 100644
--- a/Documentation/driver-api/media/drivers/index.rst
+++ b/Documentation/driver-api/media/drivers/index.rst
@@ -18,7 +18,6 @@ Video4Linux (V4L) drivers
 	fimc-devel
 	pvrusb2
 	pxa_camera
-	radiotrack
 	rkisp1
 	saa7134-devel
 	sh_mobile_ceu_camera
diff --git a/Documentation/driver-api/media/drivers/radiotrack.rst b/Documentation/driver-api/media/drivers/radiotrack.rst
deleted file mode 100644
index a85cb6205db8..000000000000
diff --git a/MAINTAINERS b/MAINTAINERS
index bc88af071e4c..b6c7a4e7a98d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -735,14 +735,6 @@ L:	linux-scsi@vger.kernel.org
 S:	Maintained
 F:	drivers/scsi/aic7xxx/

-AIMSLAB FM RADIO RECEIVER DRIVER
-M:	Hans Verkuil <hverkuil@kernel.org>
-L:	linux-media@vger.kernel.org
-S:	Maintained
-W:	https://linuxtv.org
-T:	git git://linuxtv.org/media.git
-F:	drivers/media/radio/radio-aimslab*
-
 AIO
 M:	Benjamin LaHaise <bcrl@kvack.org>
 L:	linux-aio@kvack.org
@@ -4523,14 +4515,6 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/usb/dvb-usb-v2/az6007.c

-AZTECH FM RADIO RECEIVER DRIVER
-M:	Hans Verkuil <hverkuil@kernel.org>
-L:	linux-media@vger.kernel.org
-S:	Maintained
-W:	https://linuxtv.org
-T:	git git://linuxtv.org/media.git
-F:	drivers/media/radio/radio-aztech*
-
 B43 WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 L:	b43-dev@lists.infradead.org
@@ -5800,14 +5784,6 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git
 F:	drivers/usb/cdns3/
 X:	drivers/usb/cdns3/cdns3*

-CADET FM/AM RADIO RECEIVER DRIVER
-M:	Hans Verkuil <hverkuil@kernel.org>
-L:	linux-media@vger.kernel.org
-S:	Maintained
-W:	https://linuxtv.org
-T:	git git://linuxtv.org/media.git
-F:	drivers/media/radio/radio-cadet*
-
 CAFE CMOS INTEGRATED CAMERA CONTROLLER DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
@@ -10920,14 +10896,6 @@ L:	linux-crypto@vger.kernel.org
 S:	Maintained
 F:	drivers/crypto/gemini/

-GEMTEK FM RADIO RECEIVER DRIVER
-M:	Hans Verkuil <hverkuil@kernel.org>
-L:	linux-media@vger.kernel.org
-S:	Maintained
-W:	https://linuxtv.org
-T:	git git://linuxtv.org/media.git
-F:	drivers/media/radio/radio-gemtek*
-
 GENDWARFKSYMS
 M:	Sami Tolvanen <samitolvanen@google.com>
 L:	linux-modules@vger.kernel.org
@@ -13821,14 +13789,6 @@ F:	Documentation/driver-api/isa.rst
 F:	drivers/base/isa.c
 F:	include/linux/isa.h

-ISA RADIO MODULE
-M:	Hans Verkuil <hverkuil@kernel.org>
-L:	linux-media@vger.kernel.org
-S:	Maintained
-W:	https://linuxtv.org
-T:	git git://linuxtv.org/media.git
-F:	drivers/media/radio/radio-isa*
-
 ISAPNP
 M:	Jaroslav Kysela <perex@perex.cz>
 S:	Maintained
@@ -18256,14 +18216,6 @@ F:	arch/mips/loongson64/
 F:	drivers/irqchip/irq-loongson*
 F:	drivers/platform/mips/cpu_hwmon.c

-MIROSOUND PCM20 FM RADIO RECEIVER DRIVER
-M:	Hans Verkuil <hverkuil@kernel.org>
-L:	linux-media@vger.kernel.org
-S:	Odd Fixes
-W:	https://linuxtv.org
-T:	git git://linuxtv.org/media.git
-F:	drivers/media/radio/radio-miropcm20*
-
 MITSUMI MM8013 FG DRIVER
 M:	Konrad Dybcio <konradybcio@kernel.org>
 F:	Documentation/devicetree/bindings/power/supply/mitsumi,mm8013.yaml
diff --git a/drivers/media/radio/Kconfig b/drivers/media/radio/Kconfig
index bbbdd054ba64..59c2ac04398f 100644
--- a/drivers/media/radio/Kconfig
+++ b/drivers/media/radio/Kconfig
@@ -204,285 +204,4 @@ config USB_RAREMONO
 source "drivers/media/radio/si470x/Kconfig"
 source "drivers/media/radio/si4713/Kconfig"

-#
-# ISA drivers configuration
-#
-
-menuconfig V4L_RADIO_ISA_DRIVERS
-	bool "ISA radio devices"
-	depends on ISA || COMPILE_TEST
-	depends on HAS_IOPORT
-	help
-	  Say Y here to enable support for these ISA drivers.
-
-if V4L_RADIO_ISA_DRIVERS
-
-config RADIO_AZTECH
-	tristate "Aztech/Packard Bell Radio"
-	depends on ISA || COMPILE_TEST
-	depends on HAS_IOPORT
-	select RADIO_ISA
-	help
-	  Choose Y here if you have one of these FM radio cards, and then fill
-	  in the port address below.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called radio-aztech.
-
-config RADIO_AZTECH_PORT
-	hex "Aztech/Packard Bell I/O port (0x350 or 0x358)"
-	depends on RADIO_AZTECH=y
-	default "350"
-	help
-	  Enter either 0x350 or 0x358 here.  The card default is 0x350, if you
-	  haven't changed the setting of jumper JP3 on the card.  Removing the
-	  jumper sets the card to 0x358.
-
-config RADIO_CADET
-	tristate "ADS Cadet AM/FM Tuner"
-	depends on ISA || COMPILE_TEST
-	depends on HAS_IOPORT
-	help
-	  Choose Y here if you have one of these AM/FM radio cards, and then
-	  fill in the port address below.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called radio-cadet.
-
-config RADIO_GEMTEK
-	tristate "GemTek Radio card (or compatible) support"
-	depends on ISA || COMPILE_TEST
-	depends on HAS_IOPORT
-	select RADIO_ISA
-	help
-	  Choose Y here if you have this FM radio card, and then fill in the
-	  I/O port address and settings below. The following cards either have
-	  GemTek Radio tuner or are rebranded GemTek Radio cards:
-
-	  - Sound Vision 16 Gold with FM Radio
-	  - Typhoon Radio card (some models)
-	  - Hama Radio card
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called radio-gemtek.
-
-config RADIO_GEMTEK_PORT
-	hex "Fixed I/O port (0x20c, 0x30c, 0x24c, 0x34c, 0x248 or 0x28c)"
-	depends on RADIO_GEMTEK=y
-	default "34c"
-	help
-	  Enter either 0x20c, 0x30c, 0x24c, 0x34c, 0x248 or 0x28c here. The
-	  card default is 0x34c, if you haven't changed the jumper setting
-	  on the card.
-
-	  On Sound Vision 16 Gold PnP with FM Radio (ESS1869+FM Gemtek), the I/O
-	  port is 0x20c, 0x248 or 0x28c.
-
-	  If automatic I/O port probing is enabled this port will be used only
-	  in case of automatic probing failure, ie. as a fallback.
-
-config RADIO_GEMTEK_PROBE
-	bool "Automatic I/O port probing"
-	depends on RADIO_GEMTEK=y
-	default y
-	help
-	  Say Y here to enable automatic probing for GemTek Radio card. The
-	  following ports will be probed: 0x20c, 0x30c, 0x24c, 0x34c, 0x248 and
-	  0x28c.
-
-config RADIO_ISA
-	depends on ISA || COMPILE_TEST
-	depends on HAS_IOPORT
-	tristate
-
-config RADIO_MIROPCM20
-	tristate "miroSOUND PCM20 radio"
-	depends on ISA || COMPILE_TEST
-	depends on ISA_DMA_API && SND
-	select SND_ISA
-	select SND_MIRO
-	help
-	  Choose Y here if you have this FM radio card. You also need to enable
-	  the ALSA sound system. This choice automatically selects the ALSA
-	  sound card driver "Miro miroSOUND PCM1pro/PCM12/PCM20radio" as this
-	  is required for the radio-miropcm20.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called radio-miropcm20.
-
-config RADIO_RTRACK
-	tristate "AIMSlab RadioTrack (aka RadioReveal) support"
-	depends on ISA || COMPILE_TEST
-	depends on HAS_IOPORT
-	select RADIO_ISA
-	help
-	  Choose Y here if you have one of these FM radio cards, and then fill
-	  in the port address below.
-
-	  Note that newer AIMSlab RadioTrack cards have a different chipset
-	  and are not supported by this driver.  For these cards, use the
-	  RadioTrack II driver below.
-
-	  If you have a GemTeks combined (PnP) sound- and radio card you must
-	  use this driver as a module and setup the card with isapnptools.
-	  You must also pass the module a suitable io parameter, 0x248 has
-	  been reported to be used by these cards.
-
-	  More information is contained in the file
-	  <file:Documentation/driver-api/media/drivers/radiotrack.rst>.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called radio-aimslab.
-
-config RADIO_RTRACK2
-	tristate "AIMSlab RadioTrack II support"
-	depends on ISA || COMPILE_TEST
-	select RADIO_ISA
-	help
-	  Choose Y here if you have this FM radio card, and then fill in the
-	  port address below.
-
-	  Note: this driver hasn't been tested since a long time due to lack
-	  of hardware. If you have this hardware, then please contact the
-	  linux-media mailinglist.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called radio-rtrack2.
-
-config RADIO_RTRACK2_PORT
-	hex "RadioTrack II i/o port (0x20c or 0x30c)"
-	depends on RADIO_RTRACK2=y
-	default "30c"
-	help
-	  Enter either 0x30c or 0x20c here.  The card default is 0x30c, if you
-	  haven't changed the jumper setting on the card.
-
-config RADIO_RTRACK_PORT
-	hex "RadioTrack i/o port (0x20f or 0x30f)"
-	depends on RADIO_RTRACK=y
-	default "30f"
-	help
-	  Enter either 0x30f or 0x20f here.  The card default is 0x30f, if you
-	  haven't changed the jumper setting on the card.
-
-config RADIO_SF16FMI
-	tristate "SF16-FMI/SF16-FMP/SF16-FMD Radio"
-	depends on ISA || COMPILE_TEST
-	depends on HAS_IOPORT
-	help
-	  Choose Y here if you have one of these FM radio cards.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called radio-sf16fmi.
-
-config RADIO_SF16FMR2
-	tristate "SF16-FMR2/SF16-FMD2 Radio"
-	depends on ISA || COMPILE_TEST
-	depends on HAS_IOPORT
-	select RADIO_TEA575X
-	help
-	  Choose Y here if you have one of these FM radio cards.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called radio-sf16fmr2.
-
-config RADIO_TERRATEC
-	tristate "TerraTec ActiveRadio ISA Standalone"
-	depends on ISA || COMPILE_TEST
-	depends on HAS_IOPORT
-	select RADIO_ISA
-	help
-	  Choose Y here if you have this FM radio card.
-
-	  Note: this driver hasn't been tested since a long time due to lack
-	  of hardware. If you have this hardware, then please contact the
-	  linux-media mailinglist.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called radio-terratec.
-
-config RADIO_TRUST
-	tristate "Trust FM radio card"
-	depends on ISA || COMPILE_TEST
-	depends on HAS_IOPORT
-	select RADIO_ISA
-	help
-	  This is a driver for the Trust FM radio cards. Say Y if you have
-	  such a card and want to use it under Linux.
-
-	  Note: this driver hasn't been tested since a long time due to lack
-	  of hardware. If you have this hardware, then please contact the
-	  linux-media mailinglist.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called radio-trust.
-
-config RADIO_TRUST_PORT
-	hex "Trust i/o port (usually 0x350 or 0x358)"
-	depends on RADIO_TRUST=y
-	default "350"
-	help
-	  Enter the I/O port of your Trust FM radio card. If unsure, try the
-	  values "0x350" or "0x358".
-
-config RADIO_TYPHOON
-	tristate "Typhoon Radio (a.k.a. EcoRadio)"
-	depends on ISA || COMPILE_TEST
-	depends on HAS_IOPORT
-	select RADIO_ISA
-	help
-	  Choose Y here if you have one of these FM radio cards, and then fill
-	  in the port address and the frequency used for muting below.
-
-	  Note: this driver hasn't been tested since a long time due to lack
-	  of hardware. If you have this hardware, then please contact the
-	  linux-media mailinglist.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called radio-typhoon.
-
-config RADIO_TYPHOON_MUTEFREQ
-	int "Typhoon frequency set when muting the device (kHz)"
-	depends on RADIO_TYPHOON=y
-	default "87500"
-	help
-	  Enter the frequency used for muting the radio. The device is never
-	  completely silent. If the volume is just turned down, you can still
-	  hear silent voices and music. For that reason, the frequency of the
-	  radio device is set to the frequency you can enter here whenever
-	  the device is muted. There should be no local radio station at that
-	  frequency.
-
-config RADIO_TYPHOON_PORT
-	hex "Typhoon I/O port (0x316 or 0x336)"
-	depends on RADIO_TYPHOON=y
-	default "316"
-	help
-	  Enter the I/O port of your Typhoon or EcoRadio radio card.
-
-config RADIO_ZOLTRIX
-	tristate "Zoltrix Radio"
-	depends on ISA || COMPILE_TEST
-	depends on HAS_IOPORT
-	select RADIO_ISA
-	help
-	  Choose Y here if you have one of these FM radio cards, and then fill
-	  in the port address below.
-
-	  Note: this driver hasn't been tested since a long time due to lack
-	  of hardware. If you have this hardware, then please contact the
-	  linux-media mailinglist.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called radio-zoltrix.
-
-config RADIO_ZOLTRIX_PORT
-	hex "ZOLTRIX I/O port (0x20c or 0x30c)"
-	depends on RADIO_ZOLTRIX=y
-	default "20c"
-	help
-	  Enter the I/O port of your Zoltrix radio card.
-
-endif # V4L_RADIO_ISA_DRIVERS
-
 endif # RADIO_ADAPTERS
diff --git a/drivers/media/radio/Makefile b/drivers/media/radio/Makefile
index f54693ebdb30..d087f4dcd8f2 100644
--- a/drivers/media/radio/Makefile
+++ b/drivers/media/radio/Makefile
@@ -7,17 +7,8 @@ shark2-objs := radio-shark2.o radio-tea5777.o

 # Please keep it alphabetically sorted by Kconfig name
 # (e. g. LC_ALL=C sort Makefile)
-obj-$(CONFIG_RADIO_AZTECH) += radio-aztech.o
-obj-$(CONFIG_RADIO_CADET) += radio-cadet.o
-obj-$(CONFIG_RADIO_GEMTEK) += radio-gemtek.o
-obj-$(CONFIG_RADIO_ISA) += radio-isa.o
 obj-$(CONFIG_RADIO_MAXIRADIO) += radio-maxiradio.o
-obj-$(CONFIG_RADIO_MIROPCM20) += radio-miropcm20.o
-obj-$(CONFIG_RADIO_RTRACK2) += radio-rtrack2.o
-obj-$(CONFIG_RADIO_RTRACK) += radio-aimslab.o
 obj-$(CONFIG_RADIO_SAA7706H) += saa7706h.o
-obj-$(CONFIG_RADIO_SF16FMI) += radio-sf16fmi.o
-obj-$(CONFIG_RADIO_SF16FMR2) += radio-sf16fmr2.o
 obj-$(CONFIG_RADIO_SHARK2) += shark2.o
 obj-$(CONFIG_RADIO_SHARK) += radio-shark.o
 obj-$(CONFIG_RADIO_SI470X) += si470x/
@@ -26,11 +17,7 @@ obj-$(CONFIG_RADIO_SI476X) += radio-si476x.o
 obj-$(CONFIG_RADIO_TEA575X) += tea575x.o
 obj-$(CONFIG_RADIO_TEA5764) += radio-tea5764.o
 obj-$(CONFIG_RADIO_TEF6862) += tef6862.o
-obj-$(CONFIG_RADIO_TERRATEC) += radio-terratec.o
 obj-$(CONFIG_RADIO_TIMBERDALE) += radio-timb.o
-obj-$(CONFIG_RADIO_TRUST) += radio-trust.o
-obj-$(CONFIG_RADIO_TYPHOON) += radio-typhoon.o
-obj-$(CONFIG_RADIO_ZOLTRIX) += radio-zoltrix.o

 obj-$(CONFIG_USB_DSBR) += dsbr100.o
 obj-$(CONFIG_USB_KEENE) += radio-keene.o
diff --git a/drivers/media/radio/radio-aimslab.c b/drivers/media/radio/radio-aimslab.c
deleted file mode 100644
index 1395f76b01dd..000000000000
diff --git a/drivers/media/radio/radio-aztech.c b/drivers/media/radio/radio-aztech.c
deleted file mode 100644
index 175ef2b0c6f4..000000000000
diff --git a/drivers/media/radio/radio-cadet.c b/drivers/media/radio/radio-cadet.c
deleted file mode 100644
index 53c1d1061cf4..000000000000
diff --git a/drivers/media/radio/radio-gemtek.c b/drivers/media/radio/radio-gemtek.c
deleted file mode 100644
index 7e4257e4b71d..000000000000
diff --git a/drivers/media/radio/radio-isa.c b/drivers/media/radio/radio-isa.c
deleted file mode 100644
index 1a144536ffa7..000000000000
diff --git a/drivers/media/radio/radio-isa.h b/drivers/media/radio/radio-isa.h
deleted file mode 100644
index 62ff5c3fb5d5..000000000000
diff --git a/drivers/media/radio/radio-miropcm20.c b/drivers/media/radio/radio-miropcm20.c
deleted file mode 100644
index 67712ab3d564..000000000000
diff --git a/drivers/media/radio/radio-rtrack2.c b/drivers/media/radio/radio-rtrack2.c
deleted file mode 100644
index 2891446901a0..000000000000
diff --git a/drivers/media/radio/radio-sf16fmi.c b/drivers/media/radio/radio-sf16fmi.c
deleted file mode 100644
index 1fb88c2b916c..000000000000
diff --git a/drivers/media/radio/radio-sf16fmr2.c b/drivers/media/radio/radio-sf16fmr2.c
deleted file mode 100644
index 2cc91e576fcd..000000000000
diff --git a/drivers/media/radio/radio-terratec.c b/drivers/media/radio/radio-terratec.c
deleted file mode 100644
index 9231a19d5544..000000000000
diff --git a/drivers/media/radio/radio-trust.c b/drivers/media/radio/radio-trust.c
deleted file mode 100644
index c7b30d430a70..000000000000
diff --git a/drivers/media/radio/radio-typhoon.c b/drivers/media/radio/radio-typhoon.c
deleted file mode 100644
index 3454c9a6fda3..000000000000
diff --git a/drivers/media/radio/radio-zoltrix.c b/drivers/media/radio/radio-zoltrix.c
deleted file mode 100644
index b92b249737a4..000000000000
-- 
2.53.0

