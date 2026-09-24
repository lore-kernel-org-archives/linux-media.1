Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B729A4ACC6A
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 21:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286553; cv=pass; b=M+RdKzk0bel5tCwqIxzz3Peq73n94nvX2luoKw3Vsb0UKuWAFuB6qSl3igWG9aZrN5+1VEmfQ4VXC1PHLbLxj8HuiKaM3NLu0ykb3bQvq4PE17ZHfK8wg5VpKo3KErZVkx/tX712RksbV0/UoSULnFM39/TebgajdBDwpdPvPKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286553; c=relaxed/simple;
	bh=TCCbAICDWR19TnUzl01zmd9m7fi4SdDKlnltiF2/v7w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CxWt5tv3X1Jn9r4aVuD7mbqVLdB9RkjQuf1KBqChO2GRRLlJMORsG8jBNFEcdLwSeuv5Ew8jgvJnW9YL6C/4YvCIS9FvKDbIMPnXYVX/hSQ2kMpNjPmnpKqTPqqXPVQyRk3tvjG/v5bTXOV5cx98KXym4xDFkrquHWuUe1NQ3uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ipwh7OT8; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ipwh7OT8"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99c5de614so399074a12.2
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 14:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790286550; cv=none;
        d=google.com; s=arc-20260327;
        b=WDwyuuHbrzSkcjZS7vA10OlMaYYiSXT+m49+CtL6vDmCC1VsK3O7BLUAYeLCbcWZnM
         M13rENYeJHDKnCtSepwRyuck3FLdN8wRStrDGPKyshh7ko6CDLePnsmGaZND/v1Uz4Yt
         r5nv+YEBC038WulG1dSW37CKYrnq0UHzR88bRlDXoOi6vWmodDZ6S1KC8qyCWtTJuEn6
         OP1NRbWNMmZ+9jg6uvJ+rPaEol1vaR+UgU+Xfd9R9XPCoIKzCovru0G4VMZS8H1lm7VM
         FTLFBcfBpdCWzN846jNRORRePm5d5dASoqDiiZaJrUFJzhGY7uoKpE/emerLzoMuY6pG
         V8VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=d+iT0ll470CyEirfOqyWHR0qj8lIbwjV9NYAht2tV/g=;
        fh=IUzRkny3aL69fqAbkYcREOg3pv0s+rEFbyw+eh8+RIs=;
        b=MrOeRBiwicRTK3jx9E8sWEqtkpUUVY2XwW4ZrwG1YoU+B82G3m35M2GANz5QEJHKvG
         ZgWVZ+z4h3ovZr4icIYxlOqKM1eGMG/uxuT6uDASyjPIvL6SZDH8AZGTR4ybCTdm9xUJ
         IhMuJc2W0ELRpekhBSC8GUICepA8CKTG5ezP5EQ+YsnoMU/srbcQ6X0Y/wRklIK8fwSm
         kWK2+ohg/74m8dLZoWykoSr59qt11kH+05b6JorAHhIFGUbjHTV/5IqOQHE6QrhgC8Tx
         fztYR9iFhUGwL0uWBj4EXeYa7+rYl1cFvC8+dd0n5fXnjcuaiUzJz+up2Uraqo5JV2l+
         8shw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286550; x=1790891350; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d+iT0ll470CyEirfOqyWHR0qj8lIbwjV9NYAht2tV/g=;
        b=Ipwh7OT8X5p1zNbtTYrFOv8mssPaXUVA8oNG7rxZtSbkBCnlbyEKsxrrIK1acYPRtR
         30Kg6pfq2BNOqN01DtP0x9qFiFNtWVmJXHl9WXfN8tZLc5tDS7khpIA1fEHYEvIX1csb
         5wlrt83z77anyWBZkUGFMO3ese6zHgbgMscTBD8h3Xm0Unqsp9mzGHg0BbKl9b1eItM8
         hO7kqds3Mbp5QFVXnPsvNL9AkI7DxxK7AAS6d5icV3pefOvAn4VRhrDT+eu7at+2IGk9
         vEWfo5uCmlnbC/A31a8BPTSZrMUSEBjSB9vRgg0uy/N6k04/bk3618PPmaAsvLH49oXw
         63KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286550; x=1790891350;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d+iT0ll470CyEirfOqyWHR0qj8lIbwjV9NYAht2tV/g=;
        b=DXJ6U7aJn7IW5T/IecTR7h8iZ8sOwe3i6pwlLfRoV/0zCQP9O/4QF176+VFRxhdVwm
         0nVa6ZVmMHqEHdQz8h9g18Kf44v+stXki260jX66AveBYR0oS/CaAt7DM1zmBmlEHnpF
         h9BdY3PGO2M48D2VF7sUAK6AP3hVgYjuLsMEiZO/pmpvWwyflqxp1WpaBKcX3w9/6lxw
         rP0J7lLoTCLPA8GiSD9AHMoTnufc+AAylQVN0cCcPKT2YsVG53QZoHzuVVenflCxx7QI
         2WZYrdfUP/D3OadXeVpVOk1Wvr4r3kHtp6vXeoIISFGdAZleZ15GsWRsLekLuOBXgVUh
         UYww==
X-Forwarded-Encrypted: i=1; AKwUvBzzGJji5iCx1N/6A7vMegJGI8cvEeIO2rUbeixX+iB6++AD4lyiDA3NBvf6BbILkbYOZqVVTEljDowEiw==@vger.kernel.org
X-Gm-Message-State: AFuF++lXBTEHKCEVB5pgbBB98CCZmvW5QmTdh+C6FVzyjqkt2Ai4MiSN
	J8FseKbUO+35nv15mX2zJnK9OdjgwZFX+PemjV3YT3Coc3oQSZsnvYFrhy73ggwaTrL3V/mhtTm
	v7H6s6SWSexim2+MHQwM1Aer9ss4KhA==
X-Gm-Gg: AYBFou1fBsXqRD6mvZn/wn8NMIKZuHr9JVjsDrKODRjBj9dk60nr1LSED3KJeuHZtZG
	UoD2V1wbw8HIwzASurC5vxRnrMGd7IOu4iBqiX87XxIQjcUUEpuFhw7Vm+FhAyup4dy2t0DH4Gy
	c7Z91eX1txA7dXRLh3BBdlY7m0XSfx4HBbHO+XjhVgF048hGfN+z/gkdtuKgS9WxBygrc7Ox8Sc
	Fq0QMmi2eIY7YlninOJWfyl8OOGFQhdioU7Pf34+i/LTsDqEQKdhqw3gfNCXPb5tsJgmzj3Q/l3
	oAhSYwMDDhdETdwK4xRljAejlQiqQgeMaqhLJPfKbSRFaUzdZmThOdPAoBtLcXrXq20LDGl/5Ek
	pr1j55mTqAFwQhRS7psSQeaXAQqwAzvwXi/FNZA7I3DrWK+cgGiNmEhYsGPe3kqRl
X-Received: by 2002:a17:906:730e:b0:c29:f5d5:5a91 with SMTP id
 a640c23a62f3a-c2ac23ec161mr338520866b.27.1790286549925; Thu, 24 Sep 2026
 14:49:09 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 14:49:08 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 14:49:08 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 24 Sep 2026 14:49:08 -0700
X-Gm-Features: AclHuK-ifE8Wx3X7PnhgGIrI4SsuY9g5qXNEZVUc3M1mKA7E9YdCoPUOmRTEtYI
Message-ID: <CAGEsz8HmUoQq7XLr5ZN7diWt-sWYoUwYd400vpq5jYEDEB7_vQ@mail.gmail.com>
Subject: [PATCH v2 0/2] media: amphion: fix VPU core lifetime during teardown
To: Ming Qian <ming.qian@nxp.com>, Ming Qian <ming.qian@oss.nxp.com>, 
	Zhou Peng <eagle.zhou@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

vpu_core_unregister() releases the message FIFO buffer and VPU reference
before draining queued message work. An open video instance can also keep
a pointer to devm-allocated core state while sysfs unbind removes the core
or its parent.

The first patch drains message work before releasing core state. The
second prevents manual unbind on both platform drivers and warns if core
removal encounters a live instance.

Changes in v2:
- Move vpu_core_put_vpu() after the work drain.
- Keep runtime PM and mailbox teardown unchanged.
- Address sysfs unbind in a separate patch.

Myeonghun Pak (2):
  media: amphion: drain message work before releasing core state
  media: amphion: prevent unbind while video instances are open

 drivers/media/platform/amphion/vpu_core.c | 18 +++++++++++-------
 drivers/media/platform/amphion/vpu_drv.c  |  1 +
 2 files changed, 12 insertions(+), 7 deletions(-)

-- 
2.53.0
