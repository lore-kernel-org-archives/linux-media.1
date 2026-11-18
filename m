Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035191;
	b=oIVWET29rscsLAl7pjeuhebv71q1drwccBRylqHSd3ur7ZjVXYHgM7gzQojRlxIrJ/ra
	 2hV869nRq5pF1Wf/mOH6V6AeCJDgLKWmb1BstQmcmqBv+MbHd9PDjZAs3QH91cNEhRaQX
	 BFiF3CBl9fuLWi+1a0tXAePdgmIhc4D9OI+wKn8OvMCKoOgKplFUvidpaFVrSz0zv6MJ7
	 /3Daq5Xup+OwioaIQDTpWWrZD9nxOM0UwVa70h/klbCOeKyMZrvorazcR9j2ZbjW2LDgw
	 PdUX8MveZbgzX/fA+51H7xPJEEf9J8TQIxv12BD9/9E+laUgHyn1BaHUlc4qd2Cb9hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yM3BPJ8QKqRePbbotO/o8nLTIwSIfzAlG3YqharGRPA=;
	b=Lf3azM5/KW6W745LzexHUkWomRqAHdw7atqcyTzvY7BrG/cl12F288MOEiizliji1kNl
	 /3WLBav6qXpq0/lhK0pxdEX9MKrd+qjtptDsw7DDSdpziq2MGEtaB1PYU4wHy/bCSRnaV
	 3/QLYZF+WzV+TzBRpJIr9IJ3Qx43MJ3o3HTtfEDg/xhAtyGqNYtnuCI+hIxOql4T6yp9t
	 0XHfhhdC2hnqrUnciUrTHosErIklLEsy0aK7RGuVl4xyap/x7WJNOl0wvWxg31+6wDxko
	 s9Uwj6wXbUKRsXFd2Gn812HF/71ndLNtri/cOEWUwcS0DpCrMHZyzt1EZbvEp655pbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0YGOL0/h";
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CF760A260E
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 20:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40CF760A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0YGOL0/h
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4682977f9aso191877966b.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 12:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035189; x=1795639989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yM3BPJ8QKqRePbbotO/o8nLTIwSIfzAlG3YqharGRPA=;
        b=0YGOL0/hyy6+47TsMZ+kpoOWJcdMNz0GQ5f6BO1ey+aUmPaC7C71wt2b8RcN4Npjpt
         ZZBnKB0GopgEbcVVyhxPsQdkIoxmT1KFZJ4Phbk9TfkdktIBirbceKHg97mcgujRhAB5
         9XTBHooBlgxF5Wew11cVQUHE8Hla1aNPc4Peiq6BKv3nUwdbxqjnV11oq0FG9syzUWzh
         +7JfH+eFSVVOemmQNNHUb/ulaN8WoGpGuhrjrpY+R0w4aElmtEQqoXcX2SKDk4L/eGOS
         1xR2eW/G8uFy7TstA8Fqx2tZvmS/ayRWdPAHIj2etOseL8xKMjKXkO9WQ+ii653YBZ1s
         xXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035189; x=1795639989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yM3BPJ8QKqRePbbotO/o8nLTIwSIfzAlG3YqharGRPA=;
        b=aj6XIkeMPAxCzIFVLTU/0BEc6d4nAmPgEVKQWVouC5sX1VH1NkecJfdk+gekyli/pQ
         JbVRDBuVGJ6/UzIe2LSo+MrriU2Fbwo9uEXaPMOeL/YIRX3e7dB8zPSd5CcGspety+h/
         nOfYEZbj8w0waux9KWaYK7e6/jNPlGqH8i1NP7ytAN+6SEbs62AuHstJc65fLQVBDpLt
         aGj54o6FQaM5CpEWvekQxmZdWOJ69kYFqof3tJiYWWXwPk0WX25ZbW6edfxNzMBCwI7Q
         gR0djLYrN5b1qH5rH0Fu06P8Gqx4WuQCF2ldfnrqKLqcwEHOlLnKMIWlsp8LMEgtZWos
         IgLQ==
X-Forwarded-Encrypted: i=1; AL+hErFs0Yz/cdA4AXEWF0r24sGJjWxVg3b0iHlU/j5E6sxukKKaXHp5wGfX+Fz26hL0kWKEXdzpfgEdNPqV2w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/lxWt+7m9NaHYCYrR2cO9G/KahgjeBKNdccSgltmAiFDsjCcLH
	ZeakIA3D680lAhm8fMCCY5frwF2b2Fs5B6xelFyJblrdNlURld3OP7MF
X-Gm-Gg: AYBFou0i5kxGbhpUzsE8ZliHbCcrBfArtk+x7r8XRa5At79wmoId9hvwf9IsfYfO7if
	qDxj4GJgitdwVjdYjGKS0hQ57Yn/77xrfcDqe6FNXhuuT8HCrdBXNfiTFb5++IYPO9lg2W9zogu
	PV1pThNAAtqLZ7syzF2FHho2LqICBMGDuysUC4T6povlUJ0ee7n1n9GhZvsW+d5OMWiKPpBqrtu
	cWUjnmD5CXi/Ke6pLSjEMhMhVl6VCG/+duZSX6EP/qOt88SV7n6vBv4POqmr2l/9dDbc/tPAlbe
	z+RB9PqQ7n6oxn4f3ir8CgMU2nornVfu/d1YFnzDy3mdrA/dR6Q+NjbJ5rFzz1D92mHISTFfxtN
	pvBKT7gTXgNB8+EwkfySuGms3VZXM5s48gYXbJ3pYUJbj0ScKFNHSeAjQhlLVBI08BRyMTEHCpt
	ZUujDMZsJ0L3+QLl5u4LFLQQvD2OlPC9Ub/h2DRCUJz12DriApS8YH8IB0pqPP78JAmk9pbUYdF
	O+R+MUnzfsWFyCUV4mYDN41aPB/RGipG39zyiVJga32X7C3NsWVxWx5tzaIkT7RJV6Qr4xwMamR
	lQb5+la1PLYGNUz66Z1c08SRIbSIl0vPGw6nzOq9WKbvoKP8c6uifhcJIFMiag==
X-Received: by 2002:a17:906:9f8a:b0:c41:61b9:6ef6 with SMTP id a640c23a62f3a-c510e376c7dmr374133066b.27.1795035189529;
        Wed, 18 Nov 2026 12:53:09 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5123421612sm35303166b.41.2026.11.18.12.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:53:09 -0800 (PST)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: vigneshr@ti.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v2 3/4] i2c: omap: remove unused is_rdr and is_xdr function arguments
Date: Wed, 18 Nov 2026 21:52:06 +0100
Message-ID: <20261118205213.88778-4-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118205213.88778-1-apokusinski01@gmail.com>
References: <20261118205213.88778-1-apokusinski01@gmail.com>
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

Both functions omap_i2c_{receive|transmit}_data() have unused arguments
is_{r|x}dr which can be deleted.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/i2c/busses/i2c-omap.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index f02d294db42a..3f7060d57a86 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -996,8 +996,7 @@ static int errata_omap3_i462(struct omap_i2c_dev *omap)
 	return 0;
 }
 
-static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes,
-		bool is_rdr)
+static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes)
 {
 	u16		w;
 
@@ -1017,8 +1016,7 @@ static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes,
 	}
 }
 
-static int omap_i2c_transmit_data(struct omap_i2c_dev *omap, u8 num_bytes,
-		bool is_xdr)
+static int omap_i2c_transmit_data(struct omap_i2c_dev *omap, u8 num_bytes)
 {
 	u16		w;
 
@@ -1122,7 +1120,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 					OMAP_I2C_BUFSTAT_REG) >> 8) & 0x3F;
 			}
 
-			omap_i2c_receive_data(omap, num_bytes, true);
+			omap_i2c_receive_data(omap, num_bytes);
 			omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RDR);
 			continue;
 		}
@@ -1133,7 +1131,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 			if (omap->threshold)
 				num_bytes = omap->threshold;
 
-			omap_i2c_receive_data(omap, num_bytes, false);
+			omap_i2c_receive_data(omap, num_bytes);
 			omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RRDY);
 			continue;
 		}
@@ -1145,7 +1143,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 			if (omap->fifo_size)
 				num_bytes = omap->buf_len;
 
-			ret = omap_i2c_transmit_data(omap, num_bytes, true);
+			ret = omap_i2c_transmit_data(omap, num_bytes);
 			if (ret < 0)
 				break;
 
@@ -1160,7 +1158,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 			if (omap->threshold)
 				num_bytes = omap->threshold;
 
-			ret = omap_i2c_transmit_data(omap, num_bytes, false);
+			ret = omap_i2c_transmit_data(omap, num_bytes);
 			if (ret < 0)
 				break;
 
-- 
2.56.1

