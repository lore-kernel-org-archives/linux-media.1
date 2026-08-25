Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A33470421
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 13:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787666082; cv=none; b=ZEbBhn6XfaGd6xPKWKzEesjgr9bhYp6pTt04ZWEYUSC/OfV5dL2YCbwh9YPx8dKb62R/+meJxfbOzcK2mdmtKDQOBUfpMhA9nOqx5Y3PUpxpRLiM+KCZim8w/fmQJNBHxLk9QV2whnRJIS1uSem/XGgnVupfO+bBPAH0kxNZUpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787666082; c=relaxed/simple;
	bh=HeWcAvcHoVCngDKxWDwcs8lqQkIX1yBSlztDKTCfC4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ThhGP7yF2iq2YkdZ5liVTUWRL71kAEiwlRh/3HM1axdRm5BIEg81+wVAkhjGlzj1+KWolB5e1Lkq9a8uXBga3a7y7a+uDf+FPkxwpzG/KWEZu69bNHF694F4bTwBASE4pH4c10spzEZehGpr4j7ZpfyyeF5hGkpcnuTq2tKAhbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=I8dlSs5e; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="I8dlSs5e"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so732639766b.3
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1787666079; x=1788270879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jv3tIOWEnK/99KAUgJnbIDJX1kKr30Yc7XPU554aBtU=;
        b=I8dlSs5eoufT+UgeE5PprGNT4tsU3l1O1jIMMaIQCPQxSJ/P7AAIc0/aC7juf9sQYn
         o6V1rUXY6uFrwuONYBpIIZ37Y018hIJrRLAeEQv9GSftd9Tf3xKQYtEObQllGvi077zy
         bWu5r5JHg3Adczoji67vXNMp4vzmheQcdEk0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787666079; x=1788270879;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jv3tIOWEnK/99KAUgJnbIDJX1kKr30Yc7XPU554aBtU=;
        b=R2TE3AxTRMAmzqlR+xNcVtVbFrJYJ4WjNIRXCP4Ln3XkgkcwczAyb9LeO6E9xgeCI8
         M6XyTBnALomJgzAfx+3g0mQ3k3RXanngtGs1bB9uV5LX+SbI7BDEBbgz0s97cDhntAdu
         YWr5m2nLulWC4nl4Ib4lcwNXFNjmHbtL2pSBAV3AqXTzeq8aTJnNcrGjjBMfNCIRCtT9
         cMgeIknaB/Cg0eJh1L7HaJUNs4ECqYgfUHk3VeRnLj71kwYH4/ktmP9O00+Aw5PUZvws
         o6QQWqZH2BWEdE/3B12lwJEy9GZ4HP5ojCfJVGm38Mx+bPmkx51UEVP+6f/q0tPJlHmu
         FR1A==
X-Gm-Message-State: AFuF++kPVPBw9CAsChYSllBSsVD7HWkPFkjF6VUMEhtWEvY2pxaFIgeC
	qyzAj6ARD/bx9MGo07XuGgG1ZkfiHlRDaWG20i/nlPLYHrm2JyAcBkqabaHDq0zexcxoD6JJkF5
	iHr07
X-Gm-Gg: AR+sD12bgE2gPpf2NeiT0r+VvoYM+hiXqYGDlTU7glIaY+Nbfb2jNk9sM+YJ87GaPcb
	/+bb+1ScQeDTbZocIqu1lxExZXMP+JMhEbgKkuldbgYN6rI/aFHSyfbMPZhPhdRJJaI8FRvcHSr
	BhQ3wWiP6rjYhSZuFGv51FsRHLyY8bFJ84AwjjO9nV51CcoMQaEfvgUspFwM06yatXmAuas9qP+
	414p4GotbRCiuZXxgK2FJdwcK2GEbYtfO7JISnT2ifJQXu9bKGFopohLQwVQ5PHgdBAmpjp/Bcy
	eLaUx/queDZPYhdWF462dO7a2uIlkZ0iPjkXG19JpZjF05rcEkkziEvakXNyOewyELSr2k1Auzm
	dH4gLZzjsbOccTdf05vbaZBGK77yaBsQBVKQQjsPX43Bd/g4Q4IHVI+Dy9IEJKNrAlfCLjfW0Jx
	/erTlbKG4cE7lR72lsX3+stRJnq1O1zvRhZeUN33TW7yrn+55+he9h+xNLorqqBSxq/IIlfp4Lk
	9pp3w==
X-Received: by 2002:a17:907:a089:b0:c21:450d:cd88 with SMTP id a640c23a62f3a-c24924b8000mr2955242766b.6.1787666079439;
        Tue, 25 Aug 2026 06:54:39 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968a336fsm1819330866b.60.2026.08.25.06.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 06:54:38 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v1 0/1] ARM: dts: draeger: Add devicetrees for Draeger's M48 board.
Date: Tue, 25 Aug 2026 16:54:24 +0300
Message-ID: <20260825135426.3967333-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding the device trees for “Dräger M48 on NXP i.MX6 (Q) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the same
carrier and they are cross-monitoring each other.

Petko Manolov (1):
  ARM: dts: draeger: Add devicetree files for M48 Intel/Altera SoCFPGA
    Cyclone

 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 132 ++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

