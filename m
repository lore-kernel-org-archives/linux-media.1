Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793941173;
	b=Oth8Ft96llJ9jgBPPYEb3F530/uonMGSlSdDkSqm2cuBkIBxywcno4TAliRXjAUQ6QAC
	 rTsja9QgmXDmmix6bTSIl//vmF48UiQlSD8DQV44mwKyrYdCAbEYTSqmaDjhqZ9ocxpMx
	 gLiW/F5w9Hpo0s+zsN9XUsaVujc7XuoYDGRsByxiJUQJby1oh1tTswENcHK4uBN+/rBwv
	 ASVwnBPWD5RgHqMoBaU4oTBiuybreoaXf3qjW5KGz51GknIxZ6DJWw/aI/1mTpS1Wp+C3
	 Pwz0PTEG2I2FuEgi4OIa/ynCSwVnXDmj8B+E0tz/Zr9GPTECNx4Y+iNNKjbMn/pMlIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793941173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=nk53h9xGi0i8b4U2D9YQl5+MCk7G9ktrexEt257Eljk=;
	b=BlZS0D2LU0Hyb3K//zbW6NZzS+X3Xp0zY6DjVrvd/F0muvIPKrrmeN9dgzCAM5hmkBwq
	 151UW6WcXHnmOk7Qy0SBbDpI9KWEso7mTPuMShea+9OvWl/p9sv9K/5y+wGt/SGxS00LE
	 k6X2VFjdcG3uryi1NfHtvbb9wZyBybpuWB/pJPUXY1lZt/GZu45CQtXL03wgi+em36dm0
	 OAANDt0aUvNjs79tcqpafA0nI63VWphxjhUAYhwAlm3h6j1poV6cTaIkmwLKsB8xf1ecy
	 4Ftet0UfEuNi0FVns65C2fv6nicXk9xalSBLl0Oy49oikkgEvNd1mtT09ySIpR/Chqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESnQB5SX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5938F606A31B
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 04:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5938F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESnQB5SX
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b56c428212so216087a12.2
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 20:59:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793941172; cv=none;
        d=google.com; s=arc-20260327;
        b=q6UPo5q8GkD5vpnbuf0XRPOgUKk4YJkZ9zTEKT83hm9Fg/wDs3/HveSTbP57FdJ0J5
         oZD9F9gfdX6RqhtCt0/ZIUkBzZBCFdySwHJL5/5iKjT5cdfbtSXVFWfjnoKumSXDpBAA
         GdZoQRKj/0na/jputIyhqmfGGgeW/zdv1l/yBVfudg5H169tiDDwVhy4gkVIbG2Wguzk
         AFRl9mzTNI5xDHom7hgYo+xq9jJXYzNusaqAt4jzIdgwNcm3wlZFJb5DGoROtIX9FTJ7
         q9gkNpWIT1clhuDT82tyabPeDfi5l2PN5wUNqTklgkqKJtkO5WHRZBLS0hvizAeKP5cL
         aoIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=nk53h9xGi0i8b4U2D9YQl5+MCk7G9ktrexEt257Eljk=;
        fh=lnYtzPLvSJB6hsU0dtemELGTWhOFHmzwEJoIE9NWTvY=;
        b=LpFM8AQrrncDqpmVxkFh4gkYEoeTywHTFoLzZk52C8Xj0KNYKVHJKJrKv4XrzUMZhy
         E2A7+E8dvEfi0r7bsz53tFd+CwQc0rsfO+ma0lCZMGMYhH+Dy5elql1CUi0HJCUzM+TI
         kfa4bTpaZms1xx3Ovz0OXeOgYUigkQyph7Xbax6OVZ33A9O9tC/NoJj1eVNAwNEHdGDg
         MK/32xVOs/4lBQYB7zkI1vsjKvNNA1rPPzfACh3LdMHzMGHn8x1o+wjLbqF9E9j3lgLB
         IL5tFeGkGqiA5OoTDbMvYWOoWjaTJK1snThb64OEXEwcDqPETTahhX87noeh9VG8lQkr
         tKvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793941172; x=1794545972; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nk53h9xGi0i8b4U2D9YQl5+MCk7G9ktrexEt257Eljk=;
        b=ESnQB5SXngposlYGfWXteZKpzmQdpN2v3wkEdKkj7ePkswkwBH40yzRKijfjaHGfoG
         BZH5RS1JoUo3wQfDbxoqJoS1J3KrBLHk9+EpgI2sqWqWG51cvTdMckyoXb+hiKxwbQqd
         sEvUF0l9ZI/QIsqyznngu0pWX5hHCaed3T1HKNaAJMipa5uyh7IAB8y36+82bMN0DL81
         0syn1FJTN+2Xre42vGhxcIIgN4c0YSBWkxCGXWlhy84NsOma8DOz9uYsLkvoGhXJPiCt
         QHFcJ8lcLaz8VXa1fWMALzF5myV3GwSD3km8ydMpSl3FQcLUjMa0gk4g7BgWhBvUf+sI
         /f5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793941172; x=1794545972;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nk53h9xGi0i8b4U2D9YQl5+MCk7G9ktrexEt257Eljk=;
        b=P5m7DhFOxT3itNrzUN/k333V0Vsj/0swd+1mlF6dk1pjkoUno9P2XPy/SAtXbAYQE9
         LnZtZU5A/k/5DBl1kxjMhCJkJYLngCsn8+mtIVIL1FI68IkzlI91jET6L2mj/mIYhh5/
         EcaP78zJ4zZJ83/VtOkdjtBZqlZcU8FqYVCPmb6pOHCDYXdfByAkOEJyRat6KFOGubHp
         zubUSfSGUAnvi6hGKYWycJEUnaOW0iLStkNws2c0RVwc8M2vfnXSDmXPRVQZeMy3DFDB
         en2OtI2wq3n/Y6hfZ6EMeuhob6CAgwancHgVFwxtUY0ZkT54G+XTdBX2PfCGlgDpTnPK
         bfFw==
X-Gm-Message-State: APuU4Z8KX1eaLRg0UPPWz7RIQ7JyOtdsPMzsL2OaCav7LJiDq5l1ndMs
	qnNjzvwIMm7S/MSICIBVKwjwIPSDApkErUdY4Lh5i709V4MMTqhLmXUC/hXIfRd1U/u/tVrhMAc
	yvtQIWwq9FfTjFK97+v3GJwMW7YWhZB1+sfuPjn32BA==
X-Gm-Gg: AYBFou0/Ay4QAJyp69IEwgDEzWZGX/D8RA93SScYdTjHQkdXiTjpgpaiIkv3OqcHzit
	dgKU9rT560WUoIVE0B8yb0Emq3QzxnxLkgy0QXHYBVJdFE2G0ZmBlXTlwCOwUqOewGSS2qv1G2G
	EiT8t01x/ibxus/nBpcMmG5zyK1xqnddex8gXFrTOxyVeoZttahu1o7unOlBy4CNxAW3ikjDQbH
	cI9sPZGWsXj2qJcTl27DK2YXCYvxKhqWW5Y3YVCxq+nEbNPjlUWCYbOYad9p/h11Fj38E5MT+cp
	xdEfXE6UzSgwnmD+QUoO+EWHgfPX9+JM/EdRivzPU0VgrcEuiRzHWV30QpNKc88ErGBMIaruVmI
	wWBgYufQ92IULgTQEpw8tiWlhYoJUV3LYdsJlJg==
X-Received: by 2002:a17:907:d03:b0:c41:1e13:8891 with SMTP id
 a640c23a62f3a-c4d34a64653mr110110366b.9.1793941171526; Thu, 05 Nov 2026
 20:59:31 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Shantanu Sarkar <shantanu.connect58@gmail.com>
Date: Fri, 6 Nov 2026 10:29:14 +0530
X-Gm-Features: AclHuK_6yVfvd4MvFxvFI_KwNC62wXAmnA8mSmYy2zvtvvaMyEA2xYUb-GFYXG0
Message-ID: <CAK8Z4SCRhWcbL5i6NgwiLWDCX48YbMfcJ_+nFrGxKMZiN1vG3w@mail.gmail.com>
Subject: [REGRESSION] media: em28xx: list_del corruption on dual-TS disconnect
To: "Jiangong.Han" <jiangong.han@windriver.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Commit 826915b6b65e ("media: em28xx: fix use-after-free of
dev_next->devlist on disconnect"), merged for v7.3 and backported to
stable, makes em28xx_close_extension() unconditionally do

if (dev->dev_next)
list_del(&dev->dev_next->devlist);

On a dual-TS board whose secondary device is not audio-only (the
normal DVB case), dev_next->devlist was never added to em28xx_devlist.
em28xx_duplicate_dev() kmemdup()s the zero-allocated primary in
em28xx_usb_probe() before request_modules() links the primary, so
dev_next->devlist is {NULL, NULL}, and the list_del() on disconnect
crashes. On current mainline (7.4.0-rc1, 05441d697f7f), with
CONFIG_DEBUG_LIST=y:

  em28xx 5-1:0.244: Closing input extension
  list_del corruption, ffff88810de88250->next is NULL
  ------------[ cut here ]------------
  kernel BUG at lib/list_debug.c:53!
  Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
  CPU: 1 UID: 0 PID: 32 Comm: kworker/1:1 Not tainted 7.4.0-rc1 #1 PREEMPT(full)
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009)
  Workqueue: usb_hub_wq hub_event
  Call Trace:
   em28xx_close_extension+0x15a/0x390
   em28xx_usb_disconnect+0x16b/0x2f0
   usb_unbind_interface+0x295/0x9c0
   device_release_driver_internal+0x48d/0x7d0
   bus_remove_device+0x444/0x560
   device_del+0x523/0x8f0
   usb_disable_device+0x3d4/0x8d0
   usb_disconnect+0x346/0x9a0
   hub_event+0x1bd6/0x4d10

Reproducer: syzbot's C reproducer for the bug the commit fixes
(https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c), with
one byte changed so the emulated 2040:026d device (WinTV-dualHD
01595) exposes a DVB isoc endpoint 0x84 instead of the audio endpoint
0x83, i.e. in the memcpy of the extra endpoint descriptor:

-"\x83\x99\x35\x19\x1f"
+"\x84\x99\x35\x19\x1f"

Results in QEMU (x86_64, syzbot's upstream config, 5 min per boot):
  - tree at 826915b6b65e^ (before the commit):  no crash (3 of 3 boots)
  - same tree with 826915b6b65e applied:         crash above (3 of 3)
  - mainline 05441d697f7f (7.4.0-rc1):           crash above (2 of 2)
The unmodified syzbot reproducer (audio-only secondary) is fixed by
the commit, as intended. I have not tested real hardware or the stable
backports (6.12.y, 6.18.y, 7.2.y, 7.3.y carry the same change).

How this was found: we were testing AI coding agents on old syzbot
bugs, and an AI-assisted review of the candidate patches flagged this
path; I then confirmed it with the reproducer above. No AI-written
patch is included.

#regzbot introduced: 826915b6b65e

Thanks,
Shantanu
