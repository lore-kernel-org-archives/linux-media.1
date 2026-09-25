Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7554AD4AE
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 18:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361668; cv=pass; b=gwFlWh6nK5f9YtJ78YMhZgmTZdDaY9cxPoTWZzqrDEU740UrbFoi3ugEH7tcz/kuUhTsYkEJQZdwFkyu6fDcf83wK2n652bjBaClRDRBYA8Uagyhh1qiz0i+GTX2KRLHtFBY/OzPc3AlTDazVLosNQyiiMpC6wI2ppw0+lQVROE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361668; c=relaxed/simple;
	bh=cL1tlCa6jM/ci/rkuMQUF27PfSf78/QFN4J20M5SZcw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=AuDAV4wHDrC8CiUcDY9BRsZX9UaqiyfE6eq53p1opwaUqyJGKdTW57GJbjhbrLWO+e6PR96wwB314A0zSKRaeejpJ728KSZi8Ca9PaZPRq3pruuWGh9Li4p4ZDEUeamzDIJwO16x05mDv4rZOs4Rb2VAQhFCzn2CL2Fx7SDedvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ka+IyBej; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ka+IyBej"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso1801127a12.2
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 11:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790361665; cv=none;
        d=google.com; s=arc-20260327;
        b=buPJR/nT7KJpZG8rTeRuVsj0FjcKYSOZoluEeXW/BqoieHpbhZ4W76yjNLdeJvRUIB
         Be+5/59blTrNdxVPfi8q4vojGWle80Hd/9goTbAKVjFB8GPOhX/L6R456H1NJXy0lEWK
         qdA4Kd/hoqptYpsTkslEz5Uo4cdeMbou/zcFp3JirU4ssKRDjOYrAqOq+qvC3FyiIaCv
         seLFhOX6ZS15ySgWj8t49WJwiRwoF4iVncaZ5NbkoamOI5s+1+bz5HtUfDT52cMOeAAA
         MQihpRWaylX55f5FePdKMz0C/jiPiBNn8EoE8qU8AJ8WV0tiXKl59t340ccEnFJPKIMs
         98LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=YRA6perxvKfWBMzKUqDXlzBQE/bhcqeABbzCGxoVUKY=;
        fh=k66/EOXJ1d7/feXk+62EdbA+XTKSGrVgtcyLl9Vk7LI=;
        b=BDIsuPRujYQhqeCY0uo9KquMBg6K6+P7k0l4VIdqwqslFdVSCBtMHMG2xXHJfpEviT
         ghOkKNXU8r8emTlVQujE1DsjijYSneCZnb3SiJUIHTDegwgfu1/pfYxo5t+5ozDIVl2R
         HgBK+ME8u/pf39ZravPzjiqe7yQNhJAXwgyMdqdVTHeNlGHIKv5YrIXHgpoglMHyUU2b
         1lDrOl0zNK4E8o6VF/Ea4X04X6apAONaC9X1uWYB3D44TGq0muy/Qahrs0GdzygKDklQ
         8geSMGPw++6UAU+lsL27Cc7ANUzm2f3gN24v0vdnwFDizJIWdLoZ3yiBSIGeBxvU4L1R
         EkZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361665; x=1790966465; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YRA6perxvKfWBMzKUqDXlzBQE/bhcqeABbzCGxoVUKY=;
        b=Ka+IyBejgCk2bFs6c8xQWsSjm86UOePWfzA3lob1tobFGUl7ki12p3i8VjY+fDnEEf
         7Q1huwgDNNev4iDOtDHf39EwlQO2ROSxC1hayocw/RAArmdrkHb++Hvarz50QlTqYC7Q
         7/KlJVvvMVK+ll1dPT2VuxWkSihYfCtZtmR15YHeLT3C06MQMEnTtTAYJY0PgVi7pRKQ
         5NPVbCOuaebBdyX6m6fLI9sQGwZlQVfFyekoPJRB/imxP9dSMA2Q9xnddPiziWKnuXg8
         ubQA2g8gwrZwzUY2qkokBnlh/Qdv0WFyRR81PryXxqlMvfNrND8MVjVyGgElQFRgw2DM
         +PPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361665; x=1790966465;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YRA6perxvKfWBMzKUqDXlzBQE/bhcqeABbzCGxoVUKY=;
        b=j0qW8ZffM9bLUdAtp9LpMmjFHsv1dQJRGh1hs0gO1mnP5dfGdWl9961zsNnlcgGIbr
         YzY4UO09nDlqLTD6rpXystzZEefCQdjVoW4dnSpILM56WuOBmUy2SQaiQsI+w+lhQzah
         K4Bdo/W3jbhQMv+spyJoDWLbm2C27ym5JCnUZUlcI4AvJ7wXYog6vl43ReCbmgJX2aDa
         /IPzbqnZEvziVZSIzSUt4R9TncAFrBdEWq+JXzWfgvea3H8rgnUmbMuBx80KNQ/gaq7x
         E50B7/OEJHIl7ttMOjFfxHh9Vu6Ef4+QneoyjgEQb0ULKnNgWWb8I1GXFlNjzfVbH2Or
         q0QA==
X-Forwarded-Encrypted: i=1; AKwUvBwHgRchFOSNaC3ekM/W5qzCdMcn32RBtvn7OJ8zHZhgwp7pctROPb5POVDvT37/v2eANGMU2lewL37MeQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lO2oZIB+NNp13tBxRxECZui4rTXquZb5arvax+dndu/fDWnohO
	njhMAegLI67NU8mDzIm7GKenclthF66NrnL2UEovz7uJxI4LWDdzoS9+CAH9Rvhkf92U2Q3AIVL
	BXU8Gkrgqf5KrfZl7F569rthzfb/IGw==
X-Gm-Gg: AYBFou2Co/LfAj//wu7GWra624Ps9SfRplGFHE49Ou5G1OhmojM3B0nLdQ9TP+cQsmX
	Ysst/YDGUgyFPBZF68BDhhaK3Kxbi4nv9x0olp0/haA5xMLEoHe+gl20uQs1IGPs/YikUw8vg2O
	1Du7DA8gdIZsiWgwx+1xUeDpehI+pxD2sY79OyXE3Qkmc/gN7t8zA09LxYFt51d4Al8WP5dfZmc
	bT3Zn9f2da+OWZwF2wcR0CoGs40XdPrczaCjn1WfhpszXgvng4/BXnkWBK6aEVNbJIhH4qQqV+W
	wmSWDzCTtmYqlfx/pSmIdZIT0E6mb6HI4Xe81r4mqwsnzO7aw1gpDDmfnVnEJtvPw4nV4hd2FeC
	dDODyAbXHGkT08Nj992hGiWZh2maDEhdOSLAoyRq56p5SVCDd1ID3o7bT3r3QHWfZZYj3GA8N1a
	A=
X-Received: by 2002:a05:6402:4395:b0:6aa:a328:5179 with SMTP id
 4fb4d7f45d1cf-6aac8ed1fc0mr5053304a12.9.1790361664525; Fri, 25 Sep 2026
 11:41:04 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 11:41:01 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 13:40:21 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
Date: Fri, 25 Sep 2026 11:41:01 -0700
X-Gm-Features: AclHuK8EO0nk_ovuHYZ2MiM2V_OO_n8lIvu_WfCVj09L4gss1xu1pphbhqJqk4w
Message-ID: <CAGEsz8Hurq=5MJXLD5uA-+uPJdMp55auATafawac1_3mpv65PA@mail.gmail.com>
Subject: [PATCH v3 0/2] media: amphion: fix VPU core lifetime during teardown
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

Changes in v3:
- Resend with intact diff headers after the v2 mail submission wrapped
  the diff --git lines. No code changes.

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


base-commit: 4efa625593e1e9c76346232413997556dea1d89f
-- 
2.53.0
