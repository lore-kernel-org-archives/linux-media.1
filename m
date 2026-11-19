Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076103;
	b=uOEjwgFesdvoQCsoqJ5+EzyCL8LOWohqTVpECdFNCl/bmZ6aX9Bd6+S1fpEl50QVJKY8
	 +c8EBvQ7HEgdx0s066cK7tSSFEGJWC9QB/A6MhMwISXKuIPziMxjD2jGcxqvkZr987koT
	 GZ8KSMehheteOhdwG5ZzAV88LY5zIXtMkNZ/Txj1cIovtWUogX2BIi8eCxd6TgVVl1KBI
	 J1a6Vpqy/FiQ3IdMQdmaKypi16U7ewrWZ7VH5Sr5JlvLs5tgKeNB6MHiKmJyg5b6+vOH5
	 yWrtGELEMcIkqQOuKSntDby3SS8ptA9+prdRoJWja4ssw8E9Kb5y++3aOJtQ+9FIaRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076103;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=ygx+/Ns8B/r15ANdCD7ToCfuwbLnGJWwfxf/+wh/DiI=;
	b=ppY9dA7tkUNdfwyuv2sxGSlg/+GEkHpKaRC0naSnvgUy/sz9CfztpQ/TCpOz79VI4s4Y
	 PEWykReUhIyOF+UOOZVnm+242RSVZpUw/DdECHzUfEx0ZikvTNg8Vxo26gKp8F6wIEaP5
	 L9ZGOclZC4KY+w1g267ney6HU4yGSkyRArZYBH+8kOwERSWiVlMS/IZJHq6+h14oGNI3f
	 yq6W8Xo62IDdb6ZhyEA2RgDuyLKOyjW3MfhyEa/BPgOPLFW4owUFaoDhccUIcYxObRp7t
	 iZlDjXFhC6/gjEVinu2tQJImPA4kAsBQmUvg+lz1a+td1a0nTORUIDfcZka3Nn6Uwdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.zgclab.edu.cn;
	spf=pass smtp.mailfrom=mail.zgclab.edu.cn;
	dkim=pass header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b="ILw4d9b/";
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21B860A2611;
	Thu, 19 Nov 2026 08:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C21B860A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ILw4d9b/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ygx+/Ns8B/r15ANdCD7ToCfuwbLnGJWwfxf/+wh/DiI=; b=ILw4d9b/xt07a
	IaTAzxwZWzxQ6ESQnX/zfY44kGR6LV7tV6+VkM8H+FAN4Ba8Kf6TEspddjyh5Frg
	LJwxXXxKGS25kzcL5kWLTyDDNU5UmPf3tPG7mM97CzKGmQJQ6iRMQznG2IDCRo9u
	O7yWXEWhlQLC/k0k8Fl7HMobw//D4Q=
Received: from 07.eml (unknown [58.206.202.11])
	by web3 (Coremail) with SMTP id ygQGZQCnWZECsP5qClLEAA--.2487S2;
	Thu, 19 Nov 2026 16:14:58 +0800 (CST)
From: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
To: y-abhilashchandra@ti.com
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, wanghr2026@mail.zgclab.edu.cn
Subject: [PATCH] media: ti: cal: use devm regmap for camerrx fallback
Date: Thu, 19 Nov 2026 16:14:59 +0800
Message-ID: <1795076099145-7-3a724bd9@mail.zgclab.edu.cn>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:ygQGZQCnWZECsP5qClLEAA--.2487S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCrWrWFWxZrWkWF1kZw4Utwb_yoW5Xr4rpF
	ZrWay8Cr4kWF4Skay7t3W8CF1ftr9ayF4DCr1xCwn3Zrn8Ar17tF43Aa4fAa4DJF18Ga1Y
	qF4qq34xtw4DCaUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1ln4kS14v26r1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMc
	Ij6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0
	x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GFyl42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1l
	x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
	v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IY
	x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
	Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU
	0xZFpf9x0JUVT5LUUUUU=
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAgIQD2r+rloDYAADsf

cal_init_camerarx_regmap() builds the CAMERARX syscon with a plain
regmap_init_mmio() in the legacy fallback path and nothing ever calls
regmap_exit() on it, so any later probe failure leaks the regmap and its
debugfs entry. The fallback is precisely the tolerant path used with older
device trees, and defer retries or unbind/bind cycles stack one leak per
attempt.

Use devm_regmap_init_mmio() so the regmap is released on probe failure and
on removal.

Signed-off-by: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Fixes: 8148baabd1c4 ("media: platform: re-structure TI drivers")
---

diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index c3c1073739a5..460d3e5f14d1 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -1123,7 +1123,7 @@ static int cal_init_camerarx_regmap(struct cal_dev *cal)
 	config.val_bits = 32;
 	config.max_register = resource_size(res) - 4;
 
-	syscon = regmap_init_mmio(NULL, base, &config);
+	syscon = devm_regmap_init_mmio(cal->dev, base, &config);
 	if (IS_ERR(syscon)) {
 		pr_err("regmap init failed\n");
 		return PTR_ERR(syscon);

---

PoC reproduction (7.4.0-rc2, arm64 QEMU virt, unmodified kernel):

Device tree injection, spliced into the QEMU virt machine DT:

    fck96m: clock-96m { compatible = "fixed-clock"; #clock-cells = <0>;
        clock-frequency = <96000000>; };

    reserved-memory { #address-cells = <2>; #size-cells = <2>; ranges;
        cal-regs@7f300000 { no-map; reg = <0x0 0x7f300000 0x0 0x2000>; };
        cal-camerrx@7f310000 { no-map; reg = <0x0 0x7f310000 0x0 0x1000>; }; };

    cal@7f300000 { compatible = "ti,dra72-cal";
        reg = <0x0 0x7f300000 0x0 0x1000>, <0x0 0x7f310000 0x0 0x1000>;
        reg-names = "cal_top", "camerrx_control";
        interrupt-parent = <&gpio0>; interrupts = <6 2>;
        clocks = <&fck96m>; clock-names = "fck"; };

No ti,camerrx-control phandle is present, so the legacy fallback runs and
creates the camerrx regmap; the probe then fails later in camerrx creation.

Trigger:

    modprobe ti-cal

Result:

    cal 7f300000.cal: failed to get ti,camerrx-control: -ENOENT
    cal 7f300000.cal: Unexpected CAL HW revision 0x00000000
    cal 7f300000.cal: probe with driver cal failed with error -22

The dummy0 regmap entry remains in debugfs/regmap after the failed probe.

Note: the PoC was generated with AI assistance and the vulnerability was
found by static analysis. The device tree is trusted input (a bad DT
requires root or physical access), so this is not a security fix, but it
prevents a potential resource leak or system failure on a failed probe or
an old or malformed DT.

