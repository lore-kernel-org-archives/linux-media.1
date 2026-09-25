Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8025C4A2E2E
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 13:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344037; cv=none; b=DGzmQzqnhjnGGWnFWW+zbcoGQgy1Av+99erz+35iN0VmKq0P/9WAHNoA/0jAkMw6aqCL2kIFpKFiPqgc4i++ScsjRPcE2OXE7ckulbrLVC5EKi0VZyHqWw1Dglasksxhbh+DV5B65tAxHdmk5cjLJdWjiRJ/cyE8HI6SgP1GfZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344037; c=relaxed/simple;
	bh=V/yhHYtjaZzWcbXOpYhZC2cVi/K7IsdltL86gbehZDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=J5l1bfG2NF4oYdUWbTGtvzPgtsHhUFFQcu2nRVj8LFgMwbv9rn2DAPc2ZZ8oCVVbUFW6nzAXt+uiIAAmhCQwxOF5fH2tIDS4X7dRxhPvsFg4CFhWcQEA9SEWk1qH/zYXBzOmPr7jn5LiGepZdFkB66MGzhOAlZ496yj/d+5yV0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6eKpYru; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6eKpYru"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso6799305e9.2
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 06:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790344034; x=1790948834; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GxHcb6WQYCww+ZrI9g+jQn48SUH3uJw/q4mgjc/ZDBc=;
        b=V6eKpYruiryW0QgUniXy+NfZ00slfS+SKAo44JM3UKy+Fy4e4Wdrg/NNffoGGHIxMg
         K91/AOOS3xm8CQzSUil+jQsJw7aVlsMmezLgP5OmnYY8NnzwtOX/i+zDkQRLn8SLiB/w
         9/x67Y59e9Txa01TrxZblB1z474Xk1/vAE9EeFPFotQrQelutNW52OkuEam4XpKNvuJ9
         GS6QeH5uwfVAw5ec8bOxnwzenj3F6LysLPCA+Cl5edndkUJSCd0AkiCmZyzemC4/kJE8
         5hvrzEmOA8ULjD77fFPl5kWcHZwgBSKjUicNuJ+e7oCfcB62bxn/h5q3pLmKtaKVtH62
         S6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790344034; x=1790948834;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GxHcb6WQYCww+ZrI9g+jQn48SUH3uJw/q4mgjc/ZDBc=;
        b=KM9i3yiq3xI635yWdiwEj/mnElbYoT8YQrC38fu2Ssd4QKHe16LOHXRhohZuDpY/Ea
         e4RvLIZRwAkgpsMEPcO3rE3wvDZVqtn6ORgNK8SwfJFxiuYmNOPmlxt7oGaQavULJTyZ
         8qiWcUgWF5fDOPHf4tyM8ysjVdcx02+rJwlYuBaEP6lYiyy9FZaJmDr6BnS9OeBUXN/x
         tNwkLv17K3zt9RT8Rtldkz1boWgVlywvOrULDWY/inZ95RBykQYcOaSg2VoHGpByne6Y
         vEYP2kEfufSksfzbY5BO7nXwYpIus7jUqiAcuA1dCVc8K7m752DDHla+2MpRBISTaCtC
         9IuA==
X-Gm-Message-State: AFuF++n7oieqPZR0hIFXnztoPZS2srm4Vybt9zbuoaDKpSMbzOs5+GH0
	5tNjLGLl3+Dp93jibUkP7OcLVP9FzrpBO40DdFcDlyTpXgBHWg6Kncqli768lg==
X-Gm-Gg: AYBFou2OdRo5twcaGfyXIFdqNmbSPDDbbJMCr6dKqzGKR7nQ3QBFqhsxLSYaZfBiyAB
	WD5rFWv9Athuv7aODddadIUOgryPu3d8U1wMJhuqiWrBweYEwBzdenUQWSiD5uBuYJFkzqhCRYI
	1F0+IC9dPAYpXf8CEFzgW5ue0Q1enO8z0/CFJJIVmK7WJP8Be8KEr7aWQeo9PCAO/4weX/YgDFk
	kT/3F2GBKJHTK3DhgVGcX8Ubr/mmEUepv2yiBU7XXuK7ZucwzCRvHt1b/Zr9YfsfEQPe4H/aUa+
	e379jZ480iHT6gT5+cwqHzF1bJAmgL9pmiqEUL9y1WoY/p+8Yz0pJMlFUJuASDfB6gzNsx78GDY
	VcXTcG24nTZsdWTeJIH5hZywX14eewx06NESkx9JNoQJ5Snuku2VuU0KoJ3EyYc65JA8ESqhWhM
	spXHGHH57EYi96TiwIt8KHmxXYEPd5GUUlW4tFpOQ+SBsNbpzFkiPQZgrokx/+nvM1RqoYml+WV
	dBvLx7D+wHUTMxlseqP4sp4pzbUJr/oMBZ1d+CfNDjFlADvpzYOTMA=
X-Received: by 2002:a05:600c:4745:b0:49d:2562:d670 with SMTP id 5b1f17b1804b1-49fe7b6ffbfmr98013745e9.14.1790344033365;
        Fri, 25 Sep 2026 06:47:13 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm7660766f8f.4.2026.09.25.06.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:47:12 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Fri, 25 Sep 2026 15:46:43 +0200
Subject: [PATCH v4l-utils 2/2] edid-decode: correct and complete AMD VSDB
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-jorth-amd-2-v1-2-41deccc043f0@gmail.com>
References: <20260925-jorth-amd-2-v1-0-41deccc043f0@gmail.com>
In-Reply-To: <20260925-jorth-amd-2-v1-0-41deccc043f0@gmail.com>
To: linux-media@vger.kernel.org, Julian Orth <ju.orth@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790344031; l=14776;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=V/yhHYtjaZzWcbXOpYhZC2cVi/K7IsdltL86gbehZDU=;
 b=fAf9Eo/dUwBl3KbhrHBGjOg6qlkMoXtt3m8oV+BW3S13Pii2hFR9bblo8XqVzc/X8vTUiRh15
 CAlIS84jrENBQIoWmKWN392cEKBiJiEesZPIv2uqAskKbDmD7mzI4xZ
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=

This completes the work from 07632801b9d39d4fdb41a3346e74f88b16519fa2.

Sources:

- Reverse engineering of the AMD windows kernel driver.
- Patent US10706812B2 describes FreeSync 2 HDR and contains VSDB
  examples.
- Various panel manufacturers have published or leaked data sheets that
  contain annotated EDIDs. For example [1].

Changes:

- The bits in the flags bytes are now properly labeled and printed.
- Global backlight control is no longer advertised in version 3.
- x[12..=14] contain the maximum FSFT speed.
- x[4] is the MCCS VCP code.
- 3 of the flags from x[5] are no longer used in version 3.
- 1 of the flags from x[5] indicates SmartPower OLED support in version
  3.
- x[5]&0x4 was previously labeled to indicate PQ support, but that was
  incorrect and an artifact of how the windows driver converts these
  bits.
- The meaning of PQ-Interim is now documented.
- x[5]&0x20 indicates HDR10 support in version 3.
- x[15] contains another DPCD offset that can be used by the source to
  load information about the sink product and firmware checksum.

[1]: https://www.panelook.cn/upload/202601/NS160QDM-NZ1_Rev.P0_20241125_202601266620.pdf

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 utils/edid-decode/parse-cta-block.cpp | 291 ++++++++++++++++++----------------
 1 file changed, 150 insertions(+), 141 deletions(-)

diff --git a/utils/edid-decode/parse-cta-block.cpp b/utils/edid-decode/parse-cta-block.cpp
index a52bc115..e083d968 100644
--- a/utils/edid-decode/parse-cta-block.cpp
+++ b/utils/edid-decode/parse-cta-block.cpp
@@ -1586,151 +1586,160 @@ static void cta_hf_sbtmdb(const unsigned char *x, unsigned length)
 
 static void cta_amd(const unsigned char *x, unsigned length)
 {
-    // x[00]          - major version
-    // x[01] & 0x01   - unknown, set in almost all EDIDs
-    // x[01] & 0x02   - set if x[05..=09] are valid
-    // x[01] & 0x04   - global backlight control support
-    // x[01] & 0x08   - local dimming support
-    // x[01] & 0x10   - FreeSync Panel Replay/PSR switch support
-    // x[01] & 0x20   - called the SPRS bit by AMD, related to Replay
-    // x[01] & 0x40   - FreeSync Panel Replay support
-    // x[01] & 0x80   - set if x[12..=14] are valid
-    // x[02]          - min refresh rate
-    // x[03]          - max refresh rate in versions < 3
-    // x[04]          - MCCS flags
-    // -- start of version 2 fields
-    // x[05] & 0x01   - unknown
-    // x[05] & 0x02   - unknown
-    // x[05] & 0x04   - PQ EOTF support
-    // x[05] & 0x08   - unknown
-    // x[05] & 0x10   - PQ-Interim EOTF support (unknown what that is but enumerated in ADL)
-    // x[05] & 0x20   - unknown but see the calculation of supported_tf below
-    // x[05] & 0xc0   - set to 1 if the display is Mini LED
-    //                  set to 2 if the display is OLED
-    // x[06]          - max luminance
-    // x[07]          - min luminance
-    // x[08]          -      if x[01] & 0x08 or display is OLED: max luminance without local dimming
-    //                  else if x[01] & 0x04                   : max luminance at min backlight
-    // x[09]          -      if x[01] & 0x08 or display is OLED: min luminance without local dimming
-    //                  else if x[01] & 0x04                   : min luminance at min backlight
-    // -- start of version 3 fields
-    // x[10]          - max refresh rate lower 8 bits in version >= 3
-    // x[11] & 0x03   - max refresh rate upper 2 bits in version >= 3
-    // x[11] & 0xfc   - unused
-    // -- end of version 3 mandatory fields, fields below will be parsed only if the VSDB
-    //    block is large enough
-    // x[12]          - unknown
-    // x[13]          - unknown
-    // x[14]          - unknown
-    // x[15] & 0x80   - x[15] & 0x7f is valid
-    // x[15] & 0x7f   - unknown
-    // x[16] & 0x80   - x[16] & 0x7f is valid
-    // x[16] & 0x7f   - DPCD (DisplayPort configuration data) register offset for
-    //                  proprietary AMD settings
-
-    if (length < 5) {
-        printf("    Data block is truncated (length = %d)\n", length);
-        return;
-    }
-
-    unsigned version = x[0];
+	// x[00]          - major version
+	// x[01] & 0x01   - FreeSync support
+	// x[01] & 0x02   - FreeSync 2 HDR support, x[05..=09] are valid
+	// x[01] & 0x04   - In version 2: Global Backlight Control support
+	//                  In version 3: Reserved
+	// x[01] & 0x08   - Local Dimming Control support
+	// x[01] & 0x10   - In version 3: FreeSync Panel Replay/PSR switch support
+	// x[01] & 0x20   - In version 3: Dynamic Link Rate Control support
+	// x[01] & 0x40   - In version 3: FreeSync Panel Replay support
+	// x[01] & 0x80   - In version 3: FreeSync Fast Transport (FSFT) support, x[12..=14] are valid
+	// x[02]          - min refresh rate
+	// x[03]          - max refresh rate in versions < 3
+	// x[04]          - MCCS VCP code
+	// -- start of version 2 fields
+	// x[05] & 0x01   - In version 2: sRGB EOTF support
+	//                  In version 3: Reserved
+	// x[05] & 0x02   - In version 2: BT.709 EOTF support
+	//                  In version 3: Reserved
+	// x[05] & 0x04   - Gamma 2.2 EOTF support
+	// x[05] & 0x08   - In version 2: Gamma 2.6 EOTF support
+	//                  In version 3: Reserved
+	//        NOTE:
+	//          The 4 EOTFs above use the native gamut and scale the input
+	//          of the inverse EOTF such that output 0 maps to 0 luminance
+	//          and output 1 maps to the max luminance.
+	// x[05] & 0x10   - In version 2:
+	//                      PQ-Interim EOTF support
+	//                      This uses the native gamut and an affine function is
+	//                      applied to the inverse EOTF output such that output 0 maps
+	//                      to the min luminance and output 1 maps to the max luminance.
+	//                  In version 3:
+	//                      SmartPower OLED support
+	// x[05] & 0x20   - In version 2: Reserved
+	//                  In version 3: HDR10 support
+	// x[05] & 0xc0   - In version 2: Reserved
+	//                  In version 3: set to 1 if the display is Mini LED
+	//                                set to 2 if the display is OLED
+	//                                value 3 is reserved
+	// x[06]          - max luminance
+	// x[07]          - min luminance
+	// x[08]          -      if x[01] & 0x08 or display is OLED: max luminance without local dimming
+	//                  else if x[01] & 0x04                   : max luminance at min backlight
+	// x[09]          -      if x[01] & 0x08 or display is OLED: min luminance without local dimming
+	//                  else if x[01] & 0x04                   : min luminance at min backlight
+	// -- start of version 3 fields
+	// x[10]          - max refresh rate lower 8 bits in version >= 3
+	// x[11] & 0x03   - max refresh rate upper 2 bits in version >= 3
+	// x[11] & 0xfc   - unused
+	// -- end of version 3 mandatory fields, fields below will be parsed only if the VSDB
+	//    block is large enough
+	// x[12..=14]     - FSFT maximum pixel clock in little-endian kHz.
+	// x[15] & 0x80   - x[15] & 0x7f is valid
+	// x[15] & 0x7f   - DPCD (DisplayPort configuration data) register offset for
+	//                  additional display information. (Base = 0x403)
+	// x[16] & 0x80   - x[16] & 0x7f is valid
+	// x[16] & 0x7f   - DPCD (DisplayPort configuration data) register offset for
+	//                  eDP display features handshake. (Base = 0x380)
+
+	if (length < 5) {
+		printf("    Data block is truncated (length = %d)\n", length);
+		return;
+	}
+
+	unsigned version = x[0];
 	printf("    Version: %u\n", version);
 
-	printf("    Feature Caps: 0x%02x\n", x[1]);
-    bool hdr_fields_valid = false;
-    bool supports_local_dimming = false;
-    bool has_global_backlight_control = false;
-    if (version > 1) {
-        hdr_fields_valid = x[1] & 0x02;
-        has_global_backlight_control = x[1] & 0x04;
-        supports_local_dimming = x[1] & 0x08;
-        if (has_global_backlight_control)
-            printf("      Global Backlight Control Supported\n");
-        if (supports_local_dimming)
-            printf("      Local Dimming Supported\n");
-        if (version > 2) {
-            // Obtained from:
-            // https://github.com/torvalds/linux/commit/ec8e59cb4e0c1a52d5a541fff9dcec398b48f7b4
-            if (x[1] & 0x40)
-                printf("      FreeSync Panel Replay Supported\n");
-        }
-    }
-
-    unsigned short max_refresh_rate;
-    if (version > 2 && length > 0xb) {
-        max_refresh_rate = (x[0xb] & 3) << 8 | x[0xa];
-    } else {
-        max_refresh_rate = x[3];
-    }
+	printf("    Flags 1: 0x%02x\n", x[1]);
+	if (x[1] & 0x01)
+		printf("      FreeSync Supported\n");
+	if (x[1] & 0x02 && version > 1)
+		printf("      FreeSync 2 HDR Supported\n");
+	if (x[1] & 0x04 && version == 2)
+		printf("      Global Backlight Control Supported\n");
+	if (x[1] & 0x08 && version > 1)
+		printf("      Local Dimming Supported\n");
+	if (x[1] & 0x10 && version > 2)
+		printf("      Panel Replay/PSR Switch Supported\n");
+	if (x[1] & 0x20 && version > 2)
+		printf("      Dynamic Link Rate Control Supported\n");
+	if (x[1] & 0x40 && version > 2)
+		printf("      Panel Replay Supported\n");
+	if (x[1] & 0x80 && version > 2)
+		printf("      FreeSync Fast Transport Supported\n");
+
+	unsigned short max_refresh_rate;
+	if (version > 2 && length > 11) {
+		max_refresh_rate = (x[11] & 3) << 8 | x[10];
+	} else {
+		max_refresh_rate = x[3];
+	}
 	printf("    Minimum Refresh Rate: %u Hz\n", x[2]);
 	printf("    Maximum Refresh Rate: %u Hz\n", max_refresh_rate);
-	// Freesync 1.x flags
-	// One or more of the 0xe6 bits signal that the VESA MCCS
-	// protocol is used to switch the Freesync range
-	printf("    Flags 1.x: 0x%02x%s\n", x[4],
-	       (x[4] & 0xe6) ? " (MCCS)" : "");
-
-    if (version < 2)
-        return;
-    if (length < 10) {
-        printf("    Data block is truncated (length = %d)\n", length);
-        return;
-    }
-
-    printf("    Flags 2.x: 0x%02x\n", x[5]);
-
-    if (!hdr_fields_valid)
-        return;
-
-    const unsigned TF_PQ2084         = 0x0004;
-    const unsigned TF_LINEAR_0_125   = 0x0020;
-    const unsigned TF_GAMMA_22       = 0x0080;
-
-    const unsigned CS_BT2020         = 0x0008;
-
-    // the calculation of supported_tf is a bit weird because it doesn't correspond to
-    // the description in the comment at the start of the function. but this is what ADL
-    // (AMD Display Library) reports
-    unsigned supported_tf = 0;
-    unsigned supported_cs = 0;
-    bool supports_hdr10 = x[5] & 0x34;
-    if (supports_hdr10) {
-        supported_tf |= TF_LINEAR_0_125 | TF_PQ2084;
-        supported_cs |= CS_BT2020;
-    }
-    if (x[5] & 0x04)
-        supported_tf |= TF_GAMMA_22;
-
-    if (supported_tf & TF_PQ2084)
-        printf("      ST 2084 (PQ) EOTF Supported\n");
-    if (supported_tf & TF_LINEAR_0_125)
-        printf("      Linear EOTF (Windows scRGB, 0.0 - 125.0) Supported\n");
-    if (supported_tf & TF_GAMMA_22)
-        printf("      Gamma 2.2 EOTF Supported\n");
-
-    if (supported_cs & CS_BT2020)
-        printf("      BT.2020 Gamut Supported\n");
-
-    bool is_mini_led = x[5] >> 6 == 1;
-    bool is_oled     = x[5] >> 6 == 2;
-    if (is_mini_led)
-        printf("      Display is Mini LED\n");
-    if (is_oled)
-        printf("      Display is OLED\n");
-
-    printf("    Maximum luminance: %u (%.3f cd/m^2)\n",
-           x[6], 50.0 * pow(2, x[6] / 32.0));
-    printf("    Minimum luminance: %u (%.3f cd/m^2)\n",
-           x[7], (50.0 * pow(2, x[6] / 32.0)) * pow(x[7] / 255.0, 2) / 100.0);
-    if (supports_local_dimming || is_oled || has_global_backlight_control) {
-        const char *type = "minimum backlight";
-        if (supports_local_dimming || is_oled)
-            type = "without local dimming";
-        printf("    Maximum luminance (%s): %u (%.3f cd/m^2)\n",
-               type, x[8], 50.0 * pow(2, x[8] / 32.0));
-        printf("    Minimum luminance (%s): %u (%.3f cd/m^2)\n",
-               type, x[9], (50.0 * pow(2, x[8] / 32.0)) * pow(x[9] / 255.0, 2) / 100.0);
-    }
+
+	if (x[4] != 0)
+		printf("    MCCS VCP Code: 0x%02x\n", x[4]);
+
+	if (version < 2)
+		return;
+	if (length < 10) {
+		printf("    Data block is truncated (length = %d)\n", length);
+		return;
+	}
+
+	printf("    Flags 5: 0x%02x\n", x[5]);
+	if (version >= 3) {
+		if (x[5] >> 6 == 1)
+			printf("      Display is Mini LED\n");
+		if (x[5] >> 6 == 2)
+			printf("      Display is OLED\n");
+		if (x[5] & 0x10)
+			printf("      SmartPower OLED Supported\n");
+	}
+	if (x[1] & 0x02) {
+		if (x[5] & 0x01 && version < 3)
+			printf("      sRGB EOTF Supported\n");
+		if (x[5] & 0x02 && version < 3)
+			printf("      BT.709 EOTF Supported\n");
+		if (x[5] & 0x04)
+			printf("      Gamma 2.2 EOTF Supported\n");
+		if (x[5] & 0x08 && version < 3)
+			printf("      Gamma 2.6 EOTF Supported\n");
+		if (x[5] & 0x10 && version < 3)
+			printf("      PQ-Interim EOTF Supported\n");
+		if (x[5] & 0x20 && version >= 3)
+			printf("      ST 2084 (PQ) EOTF Supported\n");
+
+		printf("    Maximum luminance: %u (%.3f cd/m^2)\n",
+		       x[6], 50.0 * pow(2, x[6] / 32.0));
+		printf("    Minimum luminance: %u (%.3f cd/m^2)\n",
+		       x[7], (50.0 * pow(2, x[6] / 32.0)) * pow(x[7] / 255.0, 2) / 100.0);
+		if (x[1] & 0x08 || (x[5] >> 6 == 2 && version > 2) || (x[1] & 0x04 && version == 2)) {
+			const char *type = "minimum backlight";
+			if (x[1] & 0x08 || (x[5] >> 6 == 2 && version > 2))
+				type = "without local dimming";
+			printf("    Maximum luminance (%s): %u (%.3f cd/m^2)\n",
+			       type, x[8], 50.0 * pow(2, x[8] / 32.0));
+			printf("    Minimum luminance (%s): %u (%.3f cd/m^2)\n",
+			       type, x[9], (50.0 * pow(2, x[8] / 32.0)) * pow(x[9] / 255.0, 2) / 100.0);
+		}
+	}
+
+	if (version < 3)
+		return;
+
+	if (length > 14 && x[1] & 0x80) {
+		unsigned khz = (unsigned)x[12] | ((unsigned)x[13] << 8) | ((unsigned)x[14] << 16);
+		printf("    FreeSync Fast Transport maximum pixel clock: %u kHz\n", khz);
+	}
+
+	if (length > 15 && x[15] & 0x80)
+		printf("    Additional Sink Information Address: 0x%x\n", 0x403 + (x[15] & 0x7f));
+
+	if (length > 16 && x[16] & 0x80)
+		printf("    eDP Display Features Handshake Address: 0x%x\n", 0x380 + (x[16] & 0x7f));
 }
 
 static std::string display_use_case(unsigned char x)

-- 
2.55.0

