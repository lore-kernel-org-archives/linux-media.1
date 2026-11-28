Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880126;
	b=gIOzb9+kj4vyWwG8sCjvXfvDj7Qu9qKlFMIINwTpOWKmC60nTQIW0vaSRn1AKYEMKZLH
	 iBvsGHs7vjyT+3DTHVCE8iOpgHv6I9PDm35LmrzTtSleG8mq5oJofyisuXugNYJyrsn63
	 hUGCgTd9uOV1CYXudDXeXAtq6oTu71Au7kPM9j7cNmV5bRqqTZEh8OCXc3rWlq4ALbQaL
	 ynfhZuZQieEHm52Q9iYTg7DdAxODcFIH4GdHe96t4C81XG+b0gCaw74hNAWT7P2dpiEC4
	 LnXLmKfDrm8828tf1at4pte7i1qUXohvrfCc7va3KB5wpnUqIHf1CiyyUTPga25dicA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=v+WhCOjHz9kC0UxC3aeycoT6WGib9fNFh6RWvttpfXY=;
	b=D95zERwdXZ8GJdKqiVmgynfPWGpcI7yr/w1e9OyrfKaqXacHNqTzHQ5JxHP6rSzyXkAN
	 4nyC485e2b1WdYfvmi9QZfWE8Ch0Aux7XM+jmKiM7BFUVNQJcB0PPU/eB3L43jOfkMFy1
	 Rw6dzfnfEbDzPPcrN9/XJgCD8XlVOOJehIQ/wFCFNMzTDpGjUABDme1zDuXxkuCzr45QK
	 nFwjgFKu/YjUMjP5dPMv0mLEkBBVI04QvAfGx65jDgfY4MuLqUWdbi2yi7E9LEpUgIGXG
	 Oscvvynn7tq/GN/HN21AcmLSXXy6vrX+UZdT4phMCi8Z0a3f/mk/alZF2utU2mFSCVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lhj41ntJ;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D96606A323
	for <linux-media@vger.kernel.org>; Sat, 28 Nov 2026 15:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36D96606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lhj41ntJ
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so73872625e9.3
        for <linux-media@vger.kernel.org>; Sat, 28 Nov 2026 07:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795880124; x=1796484924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+WhCOjHz9kC0UxC3aeycoT6WGib9fNFh6RWvttpfXY=;
        b=Lhj41ntJIj6j0g+5m/PV3M0F9CFMLiYPxvxKjMLjkJWXvno68ILod9L2mpP/CsKhFg
         I3ap1mfQ6MjWG3nnIQ6XKLaznVHiH6RwphnNkOENQl/0LLfXVEkBbDfxzJM1hjPSlCCU
         7qan8THMN6WzaJIrL2DYepj5UCNJH7QfFhiRMaexVlnF/0pPKHqjye6PpS3NybGg3z7S
         TVGk2GLi1jdlAjlyWU/6QQ1N0qP7sWGDhUnfLOeOnWNaygpd8OxBfDD6KPwJkdzynkjU
         d3ME9580Dx70y7R2Ys/xEdAeLPhkuXuOYYln3RulTlwGatX4LnS+5EL+L/1nSMsIDYRq
         Z6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795880124; x=1796484924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+WhCOjHz9kC0UxC3aeycoT6WGib9fNFh6RWvttpfXY=;
        b=ETP6AnP27uQK7SMNdC+/n3r7XQUDegE90eNQb/f2bDTuX/isCvda7vx0Wt5K9m6K2K
         DyL27+pnRAyvp05faDhdIs2lBAv/Oe6csMhiECOMXaWcbMZqsPxUbK8t1WLPU9hjrGe6
         CxmPgMMCsQFPvAN/OJ9WGh+iL0/t/3+GkfJ1JaToD3VP8NvJ+6KrItDCFDW7T569mctG
         sphyhKelLhEl/YbVJJCxVYrnOAHlXei673Chkr0ncSlWnt8uTpEl4zaAXiFaWZwpJznM
         W4IbzSv1iamwhWTI+IOGnuPIp7iEFvavgFmZuf8NiJNc47QyMSs5eFl+b5gxfiyHpdJC
         fVNw==
X-Forwarded-Encrypted: i=1; AL+hErE8yXa3FatXIE/Ei1a2pfRqKMzHaasSM3lP5vXZ62TDJ9EMZcQkEGEmDBVu+8l3hP6QWRqyk/HQuK1CvA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9uFlk5VKdnrY9dUtJVGKPJu3Ha14YYpTHrkjcdyc+dtMHH+PhI
	V02gDYK9hN2SxUfWDJIs6bJ5kORowDcsYDlWtUKw4RAmmg1xjgzZA86Y
X-Gm-Gg: AZFdTZfKpqgENePqtcR1k4nhzCVvhc4KDpk4/KDrI6vLWcqjPCV4vmR3gcJ3DCvxbKZ
	oGZDTlqbkYXNbKVJdcca7lE36ihRDz0RAAjjmuI+OIEsJoL7P7fHTqDOAur1FvVCWikt2jin0uK
	s9AyJsLWXU8Ah9QB8Oi6h03Lf37vVndXVVYj2gyToju9+gwmNSDE8UiQD0t+LUHLF9orsWefSXR
	hOE7n1FP/U1C/spPeUKYuClof9ndhZOQW84CemIAMvKTAqEp3W5gnx3p7rnsjGq4FX8DfobEOIn
	S9zlh7ZpQra+j0WRvvwbc4qdz5TtTLsBAbLWHWD1/st5LoF9cFuAuFZq6k8ahaHYFiwdGMpM87d
	BxJsDq1ITF/ooYPZ4vdEP6qBXE6Bpb0fLmzT/UCDd3CIIzWErjjuBc81myz9VUvjtzl91Hr71/P
	Cy9obwvhv1xrvSJl2cZtqVHPf+DRSVyXlTEe4UGvIyT8pnU6lBv5Ynpyj/qQSroh2wX72PsWkY2
	m0hBsIOztdNPT4Ej1DeE1bqlP/Rj3xjz3pcSPxS0hYtC4LexPL8V2cyUMSrysFf5e4hMx17zvY5
	Fy3lNUYifWbgb1bji9yEMmkR7pAIZ5LeWMd5VRtz7R7Fu3tDf8eGjNnlqWCCzw==
X-Received: by 2002:a05:600c:a117:b0:4bb:a5e1:7497 with SMTP id 5b1f17b1804b1-4bba5e18d83mr191413735e9.32.1795880124443;
        Sat, 28 Nov 2026 07:35:24 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm561359015e9.4.2026.11.28.07.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 07:35:23 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Sat, 28 Nov 2026 16:34:59 +0100
Subject: [PATCH 3/4] soc/tegra: pmc: Power up VDE partition before
 restarting Tegra20
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-t20-soft-reset-v1-3-0db458c5996b@gmail.com>
References: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
In-Reply-To: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
To: Lee Jones <lee@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: mfd@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>, linux-media@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4628;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=+L9yJ+khZAxRa3E+MLPbYZHl84vHWWJzo21sWA+6TPo=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbXl62HpkcHB/xanbbc80tjw3ThAw4qOkt7npyQ/lu1u
 npC+fOlHaUsDGJcDLJiiixmD4W+8Mzzer/h5dZOmDmsTCBDGLg4BWAi9zgY/rtM0Hm/P3KDQEOp
 dFH83KNGuxdPv947OWSlddbdP7+l95xnZLi0JjJ+86e0vNl19bnPGlaF5U61z17zdfnPaQn1va+
 ze5gB
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

The Tegra20 boot ROM hangs on a warm reset if the VDE power partition is
power-gated or clamped. The partition is powered on after a cold boot,
and since the PMC isn't reset by a warm reset, it keeps the state Linux
left it in.

This is currently worked around by the VDE driver, which powers the
partition on from its shutdown callback. That doesn't cover emergency
restarts, such as on a panic, which don't run shutdown callbacks, or the
cases where the VDE driver isn't loaded or hasn't probed yet. The PMC
driver also powers the partition down at probe time, so the cold-boot
state doesn't survive even without the VDE driver.

Power the partition on and remove its clamps from the PMC restart path
instead, right before the main reset. Factor the clamp mask computation
out of __tegra_powergate_remove_clamping() so that it can be shared.

Fixes: 8f0c714ad9be ("media: staging: tegra-vde: Turn ON power domain on shutdown")
Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 drivers/soc/tegra/pmc.c | 74 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 60 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index fcd9a644d97f..3fe4db473905 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -377,6 +377,7 @@ struct tegra_pmc_soc {
 	bool has_tsense_reset;
 	bool has_gpu_clamps;
 	bool needs_mbist_war;
+	bool needs_vde_restart_war;
 	bool has_io_pad_wren;
 	bool maybe_tz_only;
 
@@ -711,11 +712,24 @@ static int tegra_powergate_set(struct tegra_pmc *pmc, unsigned int id,
 	return err;
 }
 
+static u32 tegra_powergate_clamp_mask(unsigned int id)
+{
+	/*
+	 * Tegra 2 has a bug where PCIE and VDE clamping masks are
+	 * swapped relatively to the partition ids
+	 */
+	if (id == TEGRA_POWERGATE_VDEC)
+		return BIT(TEGRA_POWERGATE_PCIE);
+
+	if (id == TEGRA_POWERGATE_PCIE)
+		return BIT(TEGRA_POWERGATE_VDEC);
+
+	return BIT(id);
+}
+
 static int __tegra_powergate_remove_clamping(struct tegra_pmc *pmc,
 					     unsigned int id)
 {
-	u32 mask;
-
 	mutex_lock(&pmc->powergates_lock);
 
 	/*
@@ -729,18 +743,7 @@ static int __tegra_powergate_remove_clamping(struct tegra_pmc *pmc,
 		}
 	}
 
-	/*
-	 * Tegra 2 has a bug where PCIE and VDE clamping masks are
-	 * swapped relatively to the partition ids
-	 */
-	if (id == TEGRA_POWERGATE_VDEC)
-		mask = (1 << TEGRA_POWERGATE_PCIE);
-	else if (id == TEGRA_POWERGATE_PCIE)
-		mask = (1 << TEGRA_POWERGATE_VDEC);
-	else
-		mask = (1 << id);
-
-	tegra_pmc_writel(pmc, mask, REMOVE_CLAMPING);
+	tegra_pmc_writel(pmc, tegra_powergate_clamp_mask(id), REMOVE_CLAMPING);
 
 out:
 	mutex_unlock(&pmc->powergates_lock);
@@ -1189,10 +1192,52 @@ static int tegra_pmc_reboot_notify(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
+/*
+ * The Tegra20 boot ROM hangs on a warm reset if the VDE partition is
+ * power-gated or clamped, as it is powered on after a cold boot, so power
+ * it on before resetting. The PMC isn't reset, so the partition keeps its
+ * state.
+ *
+ * This runs with interrupts disabled, so tegra_powergate_set() can't be
+ * used, as it takes a mutex and sleeps. The partition is powered on without
+ * enabling its clocks and deasserting its resets, which the reset takes care
+ * of.
+ */
+static void tegra_pmc_restart_power_up_vde(struct tegra_pmc *pmc)
+{
+	const unsigned int id = TEGRA_POWERGATE_VDEC;
+	unsigned int retries = 3;
+	bool on;
+	int err;
+
+	if (!pmc->soc || !pmc->soc->needs_vde_restart_war)
+		return;
+
+	if (tegra_powergate_state(pmc, id))
+		return;
+
+	do {
+		tegra_pmc_writel(pmc, PWRGATE_TOGGLE_START | id, PWRGATE_TOGGLE);
+		err = read_poll_timeout_atomic(tegra_powergate_state, on, on,
+					       10, 100000, false, pmc, id);
+	} while (err && --retries);
+
+	if (err) {
+		pr_warn("failed to power up VDE partition: %d\n", err);
+		return;
+	}
+
+	udelay(10);
+	tegra_pmc_writel(pmc, tegra_powergate_clamp_mask(id), REMOVE_CLAMPING);
+	udelay(10);
+}
+
 static void tegra_pmc_restart(struct tegra_pmc *pmc)
 {
 	u32 value;
 
+	tegra_pmc_restart_power_up_vde(pmc);
+
 	/* reset everything but PMC_SCRATCH0 and PMC_RST_STATUS */
 	value = tegra_pmc_readl(pmc, PMC_CNTRL);
 	value |= PMC_CNTRL_MAIN_RST;
@@ -3448,6 +3493,7 @@ static const struct tegra_pmc_soc tegra20_pmc_soc = {
 	.has_tsense_reset = false,
 	.has_gpu_clamps = false,
 	.needs_mbist_war = false,
+	.needs_vde_restart_war = true,
 	.has_io_pad_wren = true,
 	.maybe_tz_only = false,
 	.num_io_pads = 0,

-- 
2.56.1

