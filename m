Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244685;
	b=i3GRdI87Euaso3SS2q1KMS/WsAW602VbcJ/lNWhHTRmQui6LXI88N7BiZU5vJAjpm/BZ
	 VrM0++9BnJCFH1mTjokGGTl4VuganmIg5JkfAFpOXMB3A4OWojHBdmlqV5FVF6k9/2J6e
	 1MBGR4lTOltaQwFCz4KXsBm0qesL39j814Aq7AHK2TT7Va9sel37zwfNH0OcbGuuSsl4T
	 lbnNxws49IiKgkH/FSegQcQVmJ2xguhj5rlxnqbd/PYYlXAqsqZuJ+9HcuptKYq13WIOt
	 EEF0umzmRRNKcQ1HaOb+QCS0KyJ4Co1VBHcykdzvL2rQ7geSO1LX9wJGG5QHvW+M+dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z2Siy8NkZqN/VokropBjA9uuaJYQWKIpte5yuEqWPog=;
	b=P9/uOsZBiQv+Y9eX6oG3KMkf4H+m5MFvEKyFzC7NC3rdl9jnchQJE0V1YjhNtZy48p7u
	 8fYSko7p7f5xUansao4dad+5IbQVIFSbCdJuST3aXHu5XIYuzNbnDTZJG1cAD5/sDE77s
	 oQROrrA66BubD6QXFEUfijMEstbPiKxpr78QmIJb91NSs1vMRebN4OdSWmHSDdOA4vfLs
	 t0K66eZZQkCNtBz7Lux6y3vpfnx7U/NjdQAzt0N4bUbWFnd2I++x8M1PztdQP7poxXAvH
	 L8A6M1mis6bol9uvW8wY311AXXCDdHpqm0nRLAIe8d3khgxJLPk0nQQp8YGhGmWD7kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rmMyyBcX;
	arc=none smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BC3606A31C
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 17:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94BC3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rmMyyBcX
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7d2dbc0a8d4so392244137.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 09:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794244683; x=1794849483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2Siy8NkZqN/VokropBjA9uuaJYQWKIpte5yuEqWPog=;
        b=rmMyyBcXW7ALMVD9INlgkPTUsukaT2oxRQw89G8pOPAcS28S0l1nSTZQCl3y51nwjv
         QJXvM07wCT4GlPuMOA1lKn1deIn3urGvfJDtYv+NJ56RqjfT4SMGK9ftM/ZdEFgLDLXr
         RvQYmTjk/m0scfX3E5G4ju0zk9P5VO+lu8rL5oer54KfhFDj+1g9LeW1BcG0G/GAc16V
         vP/cksufXyIYSLVVCNpCjTFv60ux8ReHBQNguejFmP+9XNl0tckQduyzkMvL5Mv8XRBU
         Vnh93LPxH+c7FVBR/1BJWFzvUGuWcXD27J1CFZ4PQ2NCjNSM3IUahWPEtwbrfU/FTnRO
         A7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794244683; x=1794849483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z2Siy8NkZqN/VokropBjA9uuaJYQWKIpte5yuEqWPog=;
        b=iyaCIPcrWbj2e272z1ah2nVKJz6zRe/7i5PivMyUzJ1BKmUEjXIN2OkttWjPIAgpFF
         y7PV9VeqlGJTVN1/dFuJUDsNMAcwxEPvwtdl8YOzVCByhBHjMWEQdai4TFfwFD+l/ojS
         4MqDWjuFS71NHyyLnE2X+yCiONvjdNeWjSmvromo6o2yktzIifmb1p7+KIjUXn1/8KP1
         T/58NDJ8dHes/Yu5SINUJbJ0bsI6E9tyK4HYc7uPx+46DMKFAOMtPKS/BjzeXeTO36Yn
         VObR4u3Whd22zidqqL8ingZhULkv2YKjZaW5Xt3hP+RjT61yhOpFYeCfB4SjDV/FlZqA
         7P+A==
X-Forwarded-Encrypted: i=1; AL+hErGPh7rfY1imSsp+Jr1KylugbljHiPIU3QRqpxkJhJfqTrbN05P4rT1jgv9FEDbqxnc8bre52hp3nsjwug==@vger.kernel.org
X-Gm-Message-State: APuU4Z/gQnZZk/7UWZJTsciIaePHwlGDpwnzrqAApIIRKmutkHx7Cl2P
	uBsFwC5QOd2yAUS7IXMP+fhGei6LWOHr3sraASexxLMgez0XKHzgJ/hOc0bG6KcLYC4=
X-Gm-Gg: AYBFou1nSViWDaEyPdMLCsv6bblxuXOA7y/M+h1EKKLEF5o+lv8QAPQ4IB6XtH0IDa8
	1L1ksp5Gapq0iGiTII8o90hgazxsvRzpAcM63Xk4xriC2LO3i8IsDJ8F27RrZ7lJ96++juNDTiZ
	nJZZaWuNCJMvK6iojZtJh7a+rrHAGwlHeywhSdEvWB88ZmD0pxnzEwTeq/g/P7jKjOhmB6p6Vsr
	0YJjTBM1LDih8BrVO3WmLLqTchkdmAiK7LacbTiDICtTEei64yCXZAQE7MhDOIlhgzTsAByI1cw
	aq+wETW6ZvKsSdkY2n5gZJNA9QGPpCh3X7CgiXXq4Hul2KlMQfg5MpOfJ/xS90lHlF2yYgpZLnq
	QRbO7lTDYG1n497Q5xOkdmGNnvhiAX+Qs6GFXes0mj8OOCTyc9rdt0E3CuFZMuRcumaf19ia5+Z
	o+oD7nu4w21MfE1cyJWYQUKm7hGQUVqxksGj01dCocOuJBHG3mtXR+r4TALd6KqlgKr69moXbWK
	2yFLWdb5QDGNomQ0u56tYAZkRqnDmhxXUnc928Q2T1oF19bqtbh6thPc0UDEwHicETpU0OEn43C
	/F+fpj2I1ahvur77uvDeSbl66CfvawPZh6Pj8r9nVZ3vehxMEWvK2AWcDThSV3CKvoM=
X-Received: by 2002:a05:6102:6891:b0:7d0:3ed0:c61c with SMTP id ada2fe7eead31-7d2db0c3973mr1355903137.16.1794244683474;
        Mon, 09 Nov 2026 09:18:03 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac5:dd4:1c96::2d9:5d])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2db605322sm4323468137.7.2026.11.09.09.17.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 09:18:03 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] media: qcom: camss: always stop the pipeline in stop_streaming
Date: Mon,  9 Nov 2026 14:17:57 -0300
Message-Id: <20261109171757.76911-1-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <919e9806-5e1b-49ee-a88a-7b6dd6d93c18@linaro.org>
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br> <20261109112611.94010-4-allan@fatecpompeia.edu.br> <919e9806-5e1b-49ee-a88a-7b6dd6d93c18@linaro.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 09/11/2026 13:02, Bryan O'Donoghue wrote:
> this comment is completely redundant
> Please drop.

Dropped in v3.
