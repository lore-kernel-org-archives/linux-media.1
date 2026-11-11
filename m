Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360400;
	b=PGp7Q2jiaRKMM2QRz5W6ITRD2WOvZ7lovUTpC50rtKN+tbZwtdbcbM1RtIC1/F0eQ4Ic
	 P5KXeXR5+EXQC61L3SY8yd2tUHUBmikIn2x1DXJC8cLsUL5MyQYwUcC3i4bEIj6E1P0Pz
	 DeBBbbJoH2YELtZKE/RI+CpVY7EFKREAgphTbX30U2MORDmj8de1nf5PVQoIeCmx4XMYf
	 5MojzqYrsKn69xa4Mk03cNgOrtDnIsAAm5j8IMpvzR4apBg0Cz4Wl+PBPyQf2140D0nLC
	 sRDEDpChZT21o0JZB94VIjYwMUjIMyhUFkJHowlTYBS7qpWeh7IgC5wWykL8mtMXy/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360400;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=09qL/IC7rQKWKj3F+tDBR6fWuBtoI0ocCC6CGvksUw8=;
	b=s06Wowwjeuvoix1h9IsfPlJYlWR7i2Y1Zfa8H4YI4oLW1yqwSOZ2ln2U5xBPbZFzDqv6
	 KKaZ2QT+WpwWXQbJrz4pBCskaobTEzIpIcz/S3snMDL6ipaKUCCeowMLszuzIgAQb4Fv7
	 AJtp+ujtI1kglPn720cWGTu06qrQ897bzXfEu1nR9cmlH8PxRxvzf8suvYKKe8klfnsIf
	 sYqK+xBR1E/65wNvUcJDzfiyjeIQgTT3dNx1Bqf1O+WlauOM7U8WBZTK/d8cstp8shyDA
	 9zNrvjnT4RbRYBNDZHajppm3Nk5A1dw2v4ektywtN6LTpPa3E8l66Ph8TkHwoNROWZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=SuI9af+T;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D5D606A31C
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 01:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8D5D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=SuI9af+T
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2400:2411:160:2f00:e376:67cb:cc18:4691])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7DC20219;
	Wed, 11 Nov 2026 02:24:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794360248;
	bh=pZLScvqHQnn1VUrm6cIMghIUGPIIBGt1rFR07aH+o2w=;
	h=From:To:Cc:Subject:Date:From;
	b=SuI9af+TvHSn4Li8KXzqmZCdvZcWOZgYnxcK5TZWgtgUUREurPb3DoTTKMxWbly/V
	 sAwSB3gVk0b5H0J5YQhJxtjzYe/oq5A5Kr0pyzaIENcqUfDalbjWhAaovXf7voFa05
	 3tZUeO0YO1fp1vveux86s5V0VD6lrDi7v3loTMBA=
From: Paul Elder <paul.elder@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	sakari.ailus@iki.fi,
	Paul Elder <paul.elder@ideasonboard.com>
Subject: [raw2rgbpnm] [PATCH] Fix sign compare error when checking file size
Date: Wed, 11 Nov 2026 10:25:25 +0900
Message-ID: <20261111012621.1701729-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.3
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

Fix the sign compare error when checking file size by casting the file
size returned by ftell to unsigned int, as it is a signed long being
compared against UINT_MAX.

This fixes the following compiler error:

FAILED: [code=1] raw2rgbpnm.p/raw2rgbpnm.c.o
/home/autobuild/autobuild/instance-5/output-1/host/bin/arm-buildroot-linux-gnueabi-gcc -Iraw2rgbpnm.p -I. -I.. -I../include -fdiagnostics-color=always -Wall -Winvalid-pch -Wextra -Werror -O3 -Wno-missing-field-initializers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -D_FORTIFY_SOURCE=1 -MD -MQ raw2rgbpnm.p/raw2rgbpnm.c.o -MF raw2rgbpnm.p/raw2rgbpnm.c.o.d -o raw2rgbpnm.p/raw2rgbpnm.c.o -c ../raw2rgbpnm.c
../raw2rgbpnm.c: In function 'read_raw_data':
../raw2rgbpnm.c:173:36: error: comparison of integer expressions of different signedness: 'unsigned int' and 'long int' [-Werror=sign-compare]
  173 |                 if (UINT_MAX / bpp < file_size)
      |                                    ^
../raw2rgbpnm.c:185:23: error: comparison of integer expressions of different signedness: 'long int' and 'unsigned int' [-Werror=sign-compare]
  185 |         if (file_size > UINT_MAX)
      |                       ^

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
I've been getting build failure reports from buildroot for this.
https://autobuild.buildroot.org/results/f1f070bc5ac72d8b0f2ed403273635b7459a9ae5/
---
 raw2rgbpnm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 0c71be321746..39b186473624 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -170,7 +170,7 @@ static unsigned char *read_raw_data(char *filename, unsigned int *width,
 	}
 
 	if (!*height && line_length) {
-		if (UINT_MAX / bpp < file_size)
+		if (UINT_MAX / bpp < (unsigned int)file_size)
 			error("line length too large");
 		*height = file_size / line_length;
 		*width = line_length * 8 / bpp;
@@ -182,7 +182,7 @@ static unsigned char *read_raw_data(char *filename, unsigned int *width,
 	if (!line_length || UINT_MAX / line_length < *height ||
 	    line_length < *width * bpp / 8)
 		error("stride %u is bad", line_length);
-	if (file_size > UINT_MAX)
+	if ((unsigned int)file_size > UINT_MAX)
 		error("too large file");
 	if ((unsigned int)file_size < line_length * *height)
 		error("out of input data");
-- 
2.47.3

