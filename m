Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB93401A3B
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513111; cv=none; b=G3XBt43mMpd0qJv1Jf0EcvPeSWKf2afkO6wJrYZ7VoDn8c6gfdhGyU3O0hdMuIQ1Z8ntLok5PnRqbKp/ta1ddJ5xPw7WfIvEti81Z92kktCkFdeXv3ahPk1qvsNQIGnyOHCAXRj2hE1wKTwCQmO5vAEGfcRn4SePt0096Gxlskw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513111; c=relaxed/simple;
	bh=C6HysWjRxqppt3p97xPZEPVPX1CWlCxd91lqGmMlzqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UdNmyJgjl7R+EoAeasd+AXb5+XSS586V+uqFOhmu/V0Uns6c6JF0FR0oL3U5PC0Hdv+kCKqAMZskEPN7hVkdECZ6gLuD1Eik8olE/UOdRX/gIGLUH91fkr7J/sVwfn6Yzby7szTQbsUHigld1y0aqO93Ax6wZBwZRF1xKfmOxHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJcbGIPi; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJcbGIPi"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a7e0ff423dso2640812a12.1
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 02:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788513108; x=1789117908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uJD+ZDdg6YpdXRgwGbwCMsTDK1c49tzWKw31VK68LXg=;
        b=ZJcbGIPiVJTYa8HoHsoQkRKJqOXrnl5/FXXNhY2NK8SBjuFvgvr5fvUykfTf33aHUx
         wGe/oNHWTr29B6xoC3qOh4wZ/ODtoc3Jwa7gkqpObC3uqirCb3mE5v7SmowIhrGamajC
         MLnesHv6J4TGR3mgpYLGTcDXXBP9auKUfYIxSv493H5s7ft6pCy0GYtbMbFPjtqkky/W
         1HMjTC9nMeg8asiwtRV7DPk/rP+HxZXXNh07a0U2IAuvStsCA5RK957dl9sqAZHyt0OW
         4fqja23AfIWCylIGZE1PXkrp5h142DjyHr4yBa6Vq+78PdINzyAntJpeXubwcJd2gc2V
         /KWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788513108; x=1789117908;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJD+ZDdg6YpdXRgwGbwCMsTDK1c49tzWKw31VK68LXg=;
        b=fbpQZ5MFZYijL5qwd4fdqM2P0u1JJ9oYLn2zNI9Q6k9WPCGMrDQE3t2Tu0iYUKjkrH
         uNnDBLuu0/1Bty2a7yyXsk754ATA4HbJl86SqntljpnBFa4udlAyDiy/DU0IAr2FITCl
         hNoaxmxltISMylAOMykxOSk2wC1yTzTjXmB29TPkKNXcjBsz/Hy/hRZ7EX3CS6zXFbUm
         4vQi7MhhAUvbryqSoSTPYSVaZF7aTTG0H118hv49qo6/Ji3omEmLxos1XY2B4N+6gRjQ
         TVSgwMBQGC88bN7+55zJ0EOGPMAf4VX0RWuZ7la0TRhdrg+0TPmJKR2eAznPsh6b3D6z
         mEEg==
X-Gm-Message-State: AFuF++mQ0IQ9fBSgmx0vFE3e17IGCPqi8o2qPbnbB/lKoHn+36w4hAhV
	B3cybBiqVDlFIKUL4sh79yspQYQ/caGs1a3suKHXY1z3yVfPfpxXmFdU
X-Gm-Gg: AYBFou12SFkBaOM6SVHHmFS19tPvcs9dKLTpyrg3sAf0bPsW1zTlE6r+ubGcHqWFHem
	YV8lR8hIDJqjcQKVm1zplT/WXNzSfU/PphV8OWzdNDWY0pGSiPcFKMdY7s+Or4KcYJfKp3bnDax
	7IVv1r8RDFKP7C3Ud7va5XMyIYIT+e+FYIy9V5WJtIWatQZ9vaRLceUgyazlGxA1YbyVe/7mc2g
	jwX5yXYVU0r0bGn1qyA96wlQybe5ZBAv9j3QxDQ1a0RSmvT3t2kYaAjXN5kk6jPP68NdzWRZ0nL
	95+ji/otwtRIF4ATKAAsI+lzNEgBOiCgJJVKt8UsvAsiDT73qMQhuHdmGoB29ARLqwQlBIpbOZA
	wVpKky48KopuG+8gmD0kZuIPel4udsBVxe1J+2qMD8lQmgE/2GKvsRQOhP5Bc7AfJuk0DJMbcvI
	9huFQkf02hhteh/DZUcK+1EnBHomCCn548U6E9umf0cDcYVJq/gIKDH74I1KkDeRUkKQBwJuO3M
	K4k25dupf3VDMSwN7jNESa3no3TU87J5pcbXOaxrkUgy4E/UA==
X-Received: by 2002:a17:907:9411:b0:c25:c678:ff80 with SMTP id a640c23a62f3a-c2610366a86mr121353566b.2.1788513107681;
        Fri, 04 Sep 2026 02:11:47 -0700 (PDT)
Received: from chubuchnyi-ThinkPad-P1-Gen-4i.tail30ebf2.ts.net ([158.173.155.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a98efsm78220566b.14.2026.09.04.02.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:11:47 -0700 (PDT)
From: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Quentin Freimanis <quentin@q-lab.dev>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add onsemi AR0234 image sensor binding
Date: Fri,  4 Sep 2026 12:11:35 +0300
Message-ID: <20260904091136.3234327-1-chubuchnyi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <58c0d082-b527-4fd1-9f7a-74b58b4db54d@kernel.org>
References: <20260820075524.2056029-1-eagle.alexander923@gmail.com> <20260820075524.2056029-2-eagle.alexander923@gmail.com> <20260827-legendary-viridian-tamarin-4e56e5@quoll> <CAP1tNvSg4yWHCJW6UNZ4yQv5FCjz9u5ZLpuW5Z9skkjQYbS9AA@mail.gmail.com> <21dec355-0cd7-4250-a7f4-e93f3e446504@kernel.org> <CAP1tNvT2+uNvcHf9=c_ysaM=gKrnz+5ZMTOq-8n_V+Ryx=yxLA@mail.gmail.com> <58c0d082-b527-4fd1-9f7a-74b58b4db54d@kernel.org>
Content-Type: text/plain; charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Three things that may help: the concrete colour/mono difference, a close
precedent in-tree, and a piece of earlier review that has not come up.

> What are the actual programming differences between sc, sm and "none"
> variants?

There are two hardware models; the third string is not one of them.
From patch 2/2: the models have distinct chip ids, 0x0a56 and 0x1a56,
read from CHIP_VERSION (0x3000), and an unrecognised id fails probe.
The only register write conditioned on the model is DIGITAL_TEST bit 7,
MONO_CHROME_OPERATION. The model also selects the advertised bus codes,
Y8/Y10 versus SGRBG8/SGRBG10, and the mode table exposes the 10-to-8-bit
DPCM code for colour only - though that last one is arguably a
media-bus-format gap, as there is no mono DPCM code, rather than a
sensor difference.

The suffix-less "onnn,ar0234cs" entry carries no match data, so the
model read from the chip is kept. The cssc/cssm entries do carry match
data, and on a mismatch the driver warns and uses the DT-selected one.

> So all devices are compatible? Then why compatibility is not expressed?

sony,imx678.yaml went through this exact question in May. It was posted
as a flat enum of three strings, with a description noting the variants
could be detected at runtime:

  compatible:
    enum:
      - sony,imx678
      - sony,imx678-aamr
      - sony,imx678-aaqr

Conor's objection was that a DT naming both the specific and the generic
string would then fail validation:

  https://lore.kernel.org/all/20260520-crusher-species-cf707a9a8b46@spud/

and v4 changed it to the form now in tree, with the changelog entry
"Follow Conor's suggestion of mandating both the specific and generic
device name in the compatible property":

  compatible:
    items:
      - enum:
          - sony,imx678-aamr
          - sony,imx678-aaqr
      - const: sony,imx678

Note that is the mandatory form rather than the oneOf v2 used - there
the generic string alone is not valid.

The other colour/mono bindings in that directory use a flat enum:
sony,imx296, st,vd55g1 and st,vd56g3 all describe the split in the
binding text, and aptina,mt9p031 does not. sony,imx290 uses a oneOf,
but of five model strings plus a deprecated standalone generic.

The v2 fallback form did go through dt-bindings review. Rob quoted it
down to the enum line:

  compatible:
    oneOf:
      - const: onnn,ar0234cs
      - items:
          - enum: ["onnn,ar0234cssc", "onnn,ar0234cssm"]

replied inline with

  - enum:
      - onnn,ar0234cssc
      - onnn,ar0234cssm

  Please explain somewhere what the differences between the 3 cases are.

and the quotation then resumes with "- const: onnn,ar0234cs":

  https://lore.kernel.org/all/20260812210309.GA972604-robh@kernel.org/

So that replaced the flow-style enum with a block one and left the
oneOf/items structure standing. Reverting to the v2 shape would not be
going against that review.

That leaves the question the thread has not settled: whether a bare
generic compatible is meant to be valid. Laurent listed the use cases
the model-specific strings serve, on the RFC -

  https://lore.kernel.org/linux-media/20260505163713.GE1547435@killaraus.ideasonboard.com/

avoiding a sensor power-up at boot when the module is known at build
time, and a runtime sanity check. Of those only the sanity check is
delivered today, since probe powers the sensor up and reads the id
before it looks at the match data, so a model-specific compatible does
not currently save anything at boot. He proposed both forms in that
message, and concluded "I don't think we've decided on a recommended
practice."

If one DT is meant to serve interchangeable colour and mono modules,
the v2 oneOf expresses that. If conforming DTs are expected to name the
model, the mandatory imx678 form fits, and the driver can still tolerate
generic-only DTs. Either way it seems worth saying which one in the
binding.

Thanks,
Aleksandr Chubuchnyi
