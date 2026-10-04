Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAB454774
	for <linux-media@vger.kernel.org>; Sun,  4 Oct 2026 10:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791108471; cv=none; b=KUFRlKj/VfctgYDe1U5P9baqKAQI7dhd/C6RBQ2OJR8r0FklmB/YUtkgDWIyR8kvlYnfLMCBrmKLukHwVs2fgcgzKe4MFImgS2UeCybs/93JjckgnATXSFuCumQOBzNRMsUxQKL26CZDV79TNjUhxigbdcEZTtIe/4+vImJef5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791108471; c=relaxed/simple;
	bh=xXuanE7lp9XD4BpJXSob7wWy4xTXql2KIAnl3qBm8qk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l/F49uL1lQf8b5rLq4J8wluoctpOtdI1XFZHqbvEBiO6FJoJqB+L3orxK5JsQY1f6/jXOSjcgDdgtTTpYYQoDe0XBNLL9jWMlipXaSav/STWGRbIIPwsbmWAQpsjq2R+x4uP2E9fVh3MBGUZ4eBCCRckr9zfyVxdrULksI1yvww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXEiZV0e; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXEiZV0e"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48afe75f055so714826f8f.2
        for <linux-media@vger.kernel.org>; Sun, 04 Oct 2026 03:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791108468; x=1791713268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EqbfiYnP7AfNZMrv7JgN82WipdvB2+1MApLa/afvy9c=;
        b=HXEiZV0ecN8YTt6uBQYOTslITkZJnVbrILycmSzMiHwraOTjfF5vzPWK+29eSi+nB2
         fBgpT4uNmNccbM6wdolxHAbvtBKhN2maTEj7/xXBGMk80kwFVJ296SXq/hC9owtFKXSF
         ovaRSGTf2uoxQy7OfutPbg4CLlN4cgq9arM1u08HCUSFXHn59oEL+JrAM8gdhxqLt3rU
         JBR/jLpoo9IxKWslwHdWlcyA9kaEe6Tz+mgIk2ZENFxC6CpkQzMS3ClVCkONedaKBStX
         adk7urHkimC7p6oWE4MhOlD5gR8nmApOrUpzlO0D+hlkNTFPtGeJUnBBGn77oARFhMI9
         //jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791108468; x=1791713268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EqbfiYnP7AfNZMrv7JgN82WipdvB2+1MApLa/afvy9c=;
        b=InPwwG3njF369O78Jmlufuaay0d6lrKEetAs1STt/4KfzS80jRAkRQjZ7YonUL9wpF
         MuKGGj2X/fq7Y0WAdBF3kv5Dy+apeGSlSDb6DdX76zIFFWujhVMFT9Gw3/VsxqObUR5c
         BTNfA512ljOhhxEg28Aja1V109GIZgq3YMu/WKUsTxFx9ItdFLozljDV1GAafAqNWCeX
         yqFY/aTVPDMIhb7dJfByJ3MK6e0k87zMLoKw/gse2FQk6VqomLn3yqVxSHlzG5BDVEko
         QxvIzh6WzHSE5DVnxjklQerhm7dQRlNGVpv7Iaj8JV5lCgG76n1s8Yuc7W0g8SreLfbx
         AJ3g==
X-Gm-Message-State: AFq9FYIpkrIIctMdpS5HCfI2ekPRZHp04uSXHQpFgM+oclyp2v1c+jm4
	4uvO6segh4vTQYvFpY+eAKJI2PzEhCcCgI8hSLET1TDzczB432xw8nBw
X-Gm-Gg: AYBFou3mBuhyJauFuUZw2tYa3IXOAuwOxdfLBF0Hqlf/T6L/ikTWJKOqU0xiE2ekiDN
	gHvfhHjYfGOxPOw0uhJ4II3ja5b6CmO3sexWGu5SDU76+Yy0MPewDijn7sRHc4fGh2ix6X2pohT
	19y2uRf/2FhgsrdSqnAVnHLwtFV4tA76djmjpgwLSbxBMHoBfPl67+KEymroCSaC0Bmb4IJgc84
	OVUiyUBalE6XZEDNlb9M+EJX0plpOa11IdQhLZozIkKWRKb0LylKraDTb7pdRX1LO8PhuZ9v9qC
	J9H/cpwO9V3wnuxVSvLIAbfw/DDooDMSsyeDhk6XNRjPHCS22I7CXJfezEFIysuRsTZdreGN3d+
	I0P75X4uEiv7FFuSzzdOfmL3ZJAEZAy+iN0y6MW/Xdk6lBkE4KaFYR7BFyq8z8gnjgIjNqvat7r
	j0qA0u2QoqzHsCkUx2IRyh85VBi5Bcj4ksmMML9fNWqoXbQLJMt/bWoOfOwa2i8FOzEGLXns8+J
	RLv/HZCPVgxEY8P82ojWNAtdOubnMHuYSoG4/qOnjMB3EtOS944xLCD4Q+LZf/eCntqJjZ+XHeU
	lp7bsmv2V2Rr9ZyhR/Sg1nrErbUH7XLmen4uTqUatwXzOszjyF8oJue0aIKct4VAxYEJNDQ8Tp+
	jTGeg/uPzrEmhoXG7u7lIuAvl1K/txJro
X-Received: by 2002:a5d:5848:0:b0:487:169f:d341 with SMTP id ffacd0b85a97d-48c47fc6044mr8779813f8f.12.1791108467504;
        Sun, 04 Oct 2026 03:07:47 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-b17d-de75-1ac4-0a1a.ipv6.o2.cz. [2a00:1028:c000:ddf:b17d:de75:1ac4:a1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104602sm18136032f8f.26.2026.10.04.03.07.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 03:07:47 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH v2 0/6] media: az6007/drxk/dvb-core: cope with a tuner unplugged while in use
Date: Sun,  4 Oct 2026 12:07:35 +0200
Message-ID: <20261004100741.71711-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unplugging an az6007 based tuner while it is in use can leave parts of
the DVB stack stuck on the disconnected device:

- drxk keeps accessing the device and hides the resulting errors,
- the CA thread can stay stuck polling the removed CAM slot, which
  keeps the disconnect from completing,
- userspace waiting on the DVB devices is neither woken up nor told
  that the device is gone, so the disconnect can wait indefinitely for
  it to close the devices.

This series fixes these issues by:

- treating an unreadable CAM slot status as no CAM,
- propagating -ENODEV from az6007 to drxk and stopping further device
  access,
- waking up the users of the demux, dvr and CA devices and returning
  -ENODEV or EPOLLERR to them.

Tested on:

- Linux 6.18.44 on a Turris 1.x (v1) and Linux 6.6.151 on a Turris
  Omnia (v2, series backported), both with a TechniSat CableStar Combo
  HD CI and a CAM,
- v7.3-rc2 in QEMU with vidtv and two vidtv fixes from media next [2]
  (v1 and v2).

The tests covered streaming and scanning in tvheadend, blocked read(),
poll() and epoll_wait() calls, sysfs unbind, and unplugging the tuner
or the whole USB hub. In all of them the blocked calls returned and the
disconnect completed. Without the series, unbinding vidtv with a
blocked reader hung, which is the hang that the commit message of the
second vidtv fix [2] asks about.

Changes in v2:
- Patch 5: check dmxdev->exit in the readers instead of storing -ENODEV
  in the buffer error, which a concurrent reader could clear, as
  reported by Sashiko [1]. With a test-only delay, two readers of one
  file reproduced that race in QEMU with v1 but not with v2.
- Patches 1-4 and 6 are unchanged.

v1: https://lore.kernel.org/r/20260923001410.30297-1-pepe.schlehofer@gmail.com

[1] https://linuxtv.org/mailman3/hyperkitty/list/media-ci@linuxtv.org/message/N3XJE5MO4HP2LJYOKFHIRB564HATZCTI/
[2] "media: vidtv: fix frontend reference leak on unbind" and
    "media: vidtv: fix uaf in vidtv_bridge_on_new_pkts_avail"

Josef Schlehofer (6):
  media: az6007: fix CAM status polling after disconnect
  media: az6007: propagate USB errors from I2C transfers
  media: drxk: stop retrying after disconnect
  media: drxk: stop accessing a disconnected device
  media: dvb-core: dmxdev: wake up readers on release
  media: dvb-core: wake up CA users on release

 drivers/media/dvb-core/dmxdev.c         | 36 +++++++++++++++----
 drivers/media/dvb-core/dvb_ca_en50221.c | 24 ++++++++++++-
 drivers/media/dvb-frontends/drxk_hard.c | 48 +++++++++++++++++++------
 drivers/media/dvb-frontends/drxk_hard.h |  2 +-
 drivers/media/usb/dvb-usb-v2/az6007.c   | 23 ++++++------
 5 files changed, 105 insertions(+), 28 deletions(-)


base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.54.0 (Apple Git-157)

